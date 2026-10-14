# Dynamic User <- Operand patterns (-O2)

- Total dynamic edges: **6,980,116**
- Instrumented module: `app.c` only (not `sim.c` / `start.c`).
- Compilation: optimized LLVM IR, `-O2`.
- PHI instructions are excluded as User, but retained as Operand.
- One event = one dynamically executed IR User-to-Instruction-Operand use.
- The N-event pattern is N consecutive trace events.
- Overlapping windows ARE counted; cross-block and cross-frame windows are allowed.
- These are pairs of opcodes, not unique IR instruction identities.

## Window length 1

- Window occurrences: 6,980,116
- Different patterns: 56
- CSV: `patterns_len1.csv` (top 56)

| Rank | Count | Share | Pattern |
|---:|---:|---:|---|
| 1 | 1,769,472 | 25.350% | `call <- or` |
| 2 | 442,594 | 6.341% | `udiv <- mul` |
| 3 | 442,368 | 6.338% | `mul <- call` |
| 4 | 314,288 | 4.503% | `br <- icmp` |
| 5 | 312,962 | 4.484% | `or <- phi` |
| 6 | 295,680 | 4.236% | `trunc <- shl` |
| 7 | 295,680 | 4.236% | `or <- trunc` |
| 8 | 295,296 | 4.231% | `shl <- phi` |
| 9 | 294,912 | 4.225% | `add <- udiv` |
| 10 | 239,832 | 3.436% | `load <- getelementptr` |

## Window length 2

- Window occurrences: 6,980,115
- Different patterns: 118
- CSV: `patterns_len2.csv` (top 100)

| Rank | Count | Share | Pattern |
|---:|---:|---:|---|
| 1 | 1,474,560 | 21.125% | `call <- or | call <- or` |
| 2 | 442,368 | 6.338% | `mul <- call | udiv <- mul` |
| 3 | 295,680 | 4.236% | `trunc <- shl | or <- trunc` |
| 4 | 294,912 | 4.225% | `udiv <- mul | add <- udiv` |
| 5 | 294,912 | 4.225% | `or <- trunc | call <- or` |
| 6 | 166,830 | 2.390% | `icmp <- add | br <- icmp` |
| 7 | 166,492 | 2.385% | `add <- phi | icmp <- add` |
| 8 | 147,456 | 2.113% | `getelementptr <- getelementptr | getelementptr <- phi` |
| 9 | 147,456 | 2.113% | `getelementptr <- phi | load <- getelementptr` |
| 10 | 147,456 | 2.113% | `load <- getelementptr | call <- load` |

## Window length 3

- Window occurrences: 6,980,114
- Different patterns: 152
- CSV: `patterns_len3.csv` (top 100)

| Rank | Count | Share | Pattern |
|---:|---:|---:|---|
| 1 | 1,179,648 | 16.900% | `call <- or | call <- or | call <- or` |
| 2 | 294,912 | 4.225% | `mul <- call | udiv <- mul | add <- udiv` |
| 3 | 294,912 | 4.225% | `trunc <- shl | or <- trunc | call <- or` |
| 4 | 294,912 | 4.225% | `or <- trunc | call <- or | call <- or` |
| 5 | 166,492 | 2.385% | `add <- phi | icmp <- add | br <- icmp` |
| 6 | 147,456 | 2.113% | `getelementptr <- getelementptr | getelementptr <- phi | load <- getelementptr` |
| 7 | 147,456 | 2.113% | `getelementptr <- phi | load <- getelementptr | call <- load` |
| 8 | 147,456 | 2.113% | `load <- getelementptr | call <- load | call <- call` |
| 9 | 147,456 | 2.113% | `call <- load | call <- call | icmp <- load` |
| 10 | 147,456 | 2.113% | `call <- call | icmp <- load | br <- icmp` |

## Window length 4

- Window occurrences: 6,980,113
- Different patterns: 174
- CSV: `patterns_len4.csv` (top 100)

| Rank | Count | Share | Pattern |
|---:|---:|---:|---|
| 1 | 884,736 | 12.675% | `call <- or | call <- or | call <- or | call <- or` |
| 2 | 294,912 | 4.225% | `trunc <- shl | or <- trunc | call <- or | call <- or` |
| 3 | 294,912 | 4.225% | `or <- trunc | call <- or | call <- or | call <- or` |
| 4 | 147,456 | 2.113% | `getelementptr <- getelementptr | getelementptr <- phi | load <- getelementptr | call <- load` |
| 5 | 147,456 | 2.113% | `getelementptr <- phi | load <- getelementptr | call <- load | call <- call` |
| 6 | 147,456 | 2.113% | `load <- getelementptr | call <- load | call <- call | icmp <- load` |
| 7 | 147,456 | 2.113% | `call <- load | call <- call | icmp <- load | br <- icmp` |
| 8 | 147,456 | 2.113% | `call <- call | icmp <- load | br <- icmp | mul <- call` |
| 9 | 147,456 | 2.113% | `icmp <- load | br <- icmp | mul <- call | udiv <- mul` |
| 10 | 147,456 | 2.113% | `br <- icmp | mul <- call | udiv <- mul | mul <- call` |

## Window length 5

- Window occurrences: 6,980,112
- Different patterns: 194
- CSV: `patterns_len5.csv` (top 100)

| Rank | Count | Share | Pattern |
|---:|---:|---:|---|
| 1 | 737,280 | 10.563% | `call <- or | call <- or | call <- or | call <- or | call <- or` |
| 2 | 294,912 | 4.225% | `trunc <- shl | or <- trunc | call <- or | call <- or | call <- or` |
| 3 | 147,456 | 2.113% | `getelementptr <- getelementptr | getelementptr <- phi | load <- getelementptr | call <- load | call <- call` |
| 4 | 147,456 | 2.113% | `getelementptr <- phi | load <- getelementptr | call <- load | call <- call | icmp <- load` |
| 5 | 147,456 | 2.113% | `load <- getelementptr | call <- load | call <- call | icmp <- load | br <- icmp` |
| 6 | 147,456 | 2.113% | `call <- load | call <- call | icmp <- load | br <- icmp | mul <- call` |
| 7 | 147,456 | 2.113% | `call <- call | icmp <- load | br <- icmp | mul <- call | udiv <- mul` |
| 8 | 147,456 | 2.113% | `icmp <- load | br <- icmp | mul <- call | udiv <- mul | mul <- call` |
| 9 | 147,456 | 2.113% | `br <- icmp | mul <- call | udiv <- mul | mul <- call | udiv <- mul` |
| 10 | 147,456 | 2.113% | `mul <- call | udiv <- mul | mul <- call | udiv <- mul | add <- udiv` |

