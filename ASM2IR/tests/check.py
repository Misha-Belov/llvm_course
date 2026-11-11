import pathlib
import struct
import subprocess
import sys
import tempfile

runner, reference, app = map(lambda p: str(pathlib.Path(p).resolve()), sys.argv[1:])
MODES = ('ext', 'full')

def run(args, ok=True):
    result = subprocess.run(args, text=True, capture_output=True, timeout=180)
    if ok and result.returncode != 0:
        raise AssertionError(f'{args}\n{result.stdout}\n{result.stderr}')
    if not ok and result.returncode == 0:
        raise AssertionError(f'expected failure: {args}')
    return result

with tempfile.TemporaryDirectory(prefix='wave-asm-test-') as tmp:
    root = pathlib.Path(tmp)
    source = root / 'isa.s'
    source.write_text('''
MOV r0, -7
DIV r1, r0, 3
REM r2, r0, 3
ADD r3, 0xffffffff, 2
SUB r4, 0, 1
MUL r5, 0x80000000, 2
MULDIV r6, -7, 5, 3
PACK r7, 0x123, 0x145, 0x167
ST 0, 221183, r7
LD r8, 221180, 3
MOV r9, 3
loop: SUB r9, r9, 1
BNE r9, 0, loop
MOV r10, 0
BEQ r9, 0, equal
HALT
equal: ADD r10, r10, 1
BLT -1, 0, less
HALT
less: ADD r10, r10, 1
BLE -2, -2, leq
HALT
leq: ADD r10, r10, 1
BEQ 1, 2, bad
BNE 2, 2, bad
BLT 0, -1, bad
BLE 1, 0, bad
JMP finish
bad: MOV r10, 99
finish: MOV r11, 0xffffffff
MULDIV r11, r11, 2, 2
ST 1, -1, r11
LD r12, 0xffffffff, 1
MOV r13, 0x80000000
DIV r13, r13, 1
REM r14, 7, -3
MOV r15, 0009
HALT
MOV r10, 100
''')
    expected = [-7, -2, -1, 1, -1, 0, -11, 0xff234567, 0xff234567,
                0, 3, -1, -1, 0x80000000, 1, 9]
    snapshots = []
    for mode in MODES:
        state = root / (mode + '.bin')
        dump = root / (mode + '.ll')
        args = [runner, mode, str(source), '--state', str(state)]
        args += ['--dump', str(dump)]
        run(args)
        data = state.read_bytes()
        registers = struct.unpack_from('=32I', data)
        assert registers[:len(expected)] == tuple(v & 0xffffffff for v in expected), (mode, registers)
        assert struct.unpack_from('=I', data, (32 + 221183) * 4)[0] == 0xff234567
        snapshots.append(data)
        ir = dump.read_text()
        assert 'br i1' in ir
        if mode == 'ext':
            assert 'call i32 @emu_MULDIV' in ir
            assert '@emu_BEQ' not in ir
        else:
            assert '@emu_' not in ir
            assert 'sdiv i32' in ir and 'srem i32' in ir
    assert snapshots[0] == snapshots[1]
    print('ISA arithmetic, memory, aliasing and branches: OK', flush=True)

    for text in ('MOV r0, 9\n', 'JMP end\nMOV r0, 9\nend:\n'):
        source.write_text(text)
        for mode in MODES:
            run([runner, mode, str(source)])

    invalid = [('', 'empty program'), ('WHAT r0\n', 'unknown opcode'),
               ('MOV r32, 0\n', 'register out of range'), ('MOV 0, 1\n', 'destination'),
               ('MOV r0\n', 'missing operand'), ('HALT 1\n', 'unexpected operand'),
               ('a: HALT\na: HALT\n', 'duplicate label'), ('JMP nowhere\n', 'unknown label'),
               ('MOV r0, 4294967296\n', 'invalid 32-bit immediate'),
               ('MOV r0, -2147483649\n', 'invalid 32-bit immediate'),
               ('MOV r0, 12foo\n', 'invalid 32-bit immediate')]
    for text, diagnostic in invalid:
        source.write_text(text)
        for mode in MODES:
            result = run([runner, mode, str(source)], ok=False)
            assert diagnostic in result.stderr, result.stderr
    for text, diagnostic in [
        ('LD r0, 0, -1', 'memory address out of range'),
        ('ST 221184, 0, 7', 'memory address out of range'),
        ('DIV r0, 1, 0', 'invalid signed division'),
        ('REM r0, 0x80000000, -1', 'invalid signed division'),
        ('MULDIV r0, 0x40000000, 2, -1', 'invalid signed division'),
    ]:
        source.write_text(text + '\nHALT\n')
        for mode in MODES:
            result = run([runner, mode, str(source)], ok=False)
            assert diagnostic in result.stderr, result.stderr
    print('Parser diagnostics and runtime faults: OK', flush=True)

    for frames, seed in ((1, 1), (3, 7), (72, 42), (150, 1)):
        expected_output = run([reference, str(frames), str(seed)]).stdout
        snapshots = []
        for mode in MODES:
            state = root / (mode + '.bin')
            args = [runner, mode, app, '--frames', str(frames), '--seed', str(seed), '--state', str(state)]
            args += ['--dump', str(root / (mode + '.ll'))]
            result = run(args)
            assert result.stdout == expected_output, (frames, seed, mode, expected_output, result.stdout)
            snapshots.append(state.read_bytes())
        assert snapshots[0] == snapshots[1], (frames, seed, 'VM state mismatch')
        print(f'C == ext == full (seed={seed}): {expected_output.strip()}', flush=True)
print('All checks passed.', flush=True)
