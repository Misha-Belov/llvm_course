#!/usr/bin/env python3
"""Count contiguous 1..5-event patterns in a dynamic User<-Operand trace.

trace.bin is a stream of little-endian (u32 UserOpcode, u32 OperandOpcode)
pairs, produced by trace_runtime.c; opcodes.tsv records opcode names.
"""
import argparse
import csv
import gzip
from collections import Counter, deque
from pathlib import Path
from struct import Struct

PAIR = Struct('<II')
WINDOW_MAX = 5


def read_dictionary(path):
    mapping = {}
    with path.open(encoding='utf-8') as f:
        for line in f:
            if not line.strip():
                continue
            code, name = line.rstrip('\n').split('\t', 1)
            mapping[int(code)] = name
    return mapping


def iter_pairs(path, chunk_bytes=PAIR.size * 65536):
    opener = gzip.open if path.suffix == '.gz' else open
    with opener(path, 'rb') as f:
        while raw := f.read(chunk_bytes):
            if len(raw) % PAIR.size:
                raise ValueError('Truncated trace: size is not divisible by 8')
            for user, operand in PAIR.iter_unpack(raw):
                yield (user, operand)


def analyze(trace, mapping, results_dir, top=100):
    results_dir.mkdir(parents=True, exist_ok=True)
    counters = [Counter() for _ in range(WINDOW_MAX)]
    history = deque(maxlen=WINDOW_MAX)
    sample = []
    total = 0

    for edge in iter_pairs(trace):
        if edge[0] not in mapping or edge[1] not in mapping:
            raise ValueError(f'Unknown opcode in event #{total}: {edge}')
        if mapping[edge[0]] == 'phi':
            raise ValueError(f'User is phi in event #{total}')
        if len(sample) < 100:
            sample.append(f'{mapping[edge[0]]} <- {mapping[edge[1]]}')
        history.append(edge)
        # Important: each window spans consecutive EVENTS, not static IR.
        # Windows may naturally cross basic-block/function/frame boundaries.
        h = list(history)
        for length in range(1, len(h) + 1):
            counters[length - 1][tuple(h[-length:])] += 1
        total += 1

    if total == 0:
        raise ValueError('Empty dynamic trace')
    (results_dir / 'trace_sample.txt').write_text(
        '\n'.join(sample) + '\n', encoding='utf-8')

    def pretty(pattern):
        return ' | '.join(f'{mapping[u]} <- {mapping[o]}' for u, o in pattern)

    report = [
        '# Dynamic User <- Operand patterns (-O2)',
        '',
        f'- Total dynamic edges: **{total:,}**',
        '- Instrumented module: `app.c` only (not `sim.c` / `start.c`).',
        '- Compilation: optimized LLVM IR, `-O2`.',
        '- PHI instructions are excluded as User, but retained as Operand.',
        '- One event = one dynamically executed IR User-to-Instruction-Operand use.',
        '- The N-event pattern is N consecutive trace events.',
        '- Overlapping windows ARE counted; cross-block and cross-frame windows are allowed.',
        '- These are pairs of opcodes, not unique IR instruction identities.',
        '',
    ]
    for length, counts in enumerate(counters, start=1):
        n_windows = max(0, total - length + 1)
        file = results_dir / f'patterns_len{length}.csv'
        with file.open('w', newline='', encoding='utf-8') as out:
            writer = csv.writer(out)
            writer.writerow(['rank', 'count', 'percent', 'pattern'])
            for rank, (pattern, count) in enumerate(counts.most_common(top), start=1):
                writer.writerow([rank, count, f'{100.0 * count / n_windows:.6f}', pretty(pattern)])
        report += [
            f'## Window length {length}',
            '',
            f'- Window occurrences: {n_windows:,}',
            f'- Different patterns: {len(counts):,}',
            f'- CSV: `patterns_len{length}.csv` (top {min(top, len(counts))})',
            '',
            '| Rank | Count | Share | Pattern |',
            '|---:|---:|---:|---|',
        ]
        for rank, (pattern, count) in enumerate(counts.most_common(10), start=1):
            report.append(
                f'| {rank} | {count:,} | {100.0 * count / n_windows:.3f}% | '
                f'`{pretty(pattern)}` |'
            )
        report.append('')
    (results_dir / 'summary.md').write_text('\n'.join(report) + '\n', encoding='utf-8')
    print(f'Analyzed {total:,} dynamic edges. Results: {results_dir}')
    for length, counts in enumerate(counters, start=1):
        if counts:
            pattern, count = counts.most_common(1)[0]
            print(f'  n={length}: {count:,} occurrences: {pretty(pattern)}')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--trace', type=Path, required=True)
    parser.add_argument('--opcodes', type=Path, required=True)
    parser.add_argument('--out-dir', type=Path, required=True)
    parser.add_argument('--top', type=int, default=100,
                        help='number of leading patterns saved per window size')
    args = parser.parse_args()
    if args.top < 10:
        parser.error('--top must be >= 10')
    analyze(args.trace, read_dictionary(args.opcodes), args.out_dir, args.top)


if __name__ == '__main__':
    main()
