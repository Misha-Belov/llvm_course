    MOV r0, 0
    MOV r1, 73728
    MOV r2, 147456
    MOV r3, 0
    MOV r4, 0
clear:
    ST 0, r4, 0
    ADD r4, r4, 1
    BLT r4, 221184, clear

frame:
    REM r4, r3, 70
    BNE r4, 0, draw
    RAND r4
    REM r4, r4, 368
    ADD r4, r4, 8
    RAND r5
    REM r5, r5, 176
    ADD r5, r5, 8
    MOV r7, -6
source_row:
    MOV r6, -6
source_cell:
    MUL r8, r6, r6
    MUL r14, r7, r7
    ADD r8, r8, r14
    BLT 36, r8, source_next
    ADD r9, r4, r6
    ADD r10, r5, r7
    BLE r9, 0, source_next
    BLE 383, r9, source_next
    BLE r10, 0, source_next
    BLE 191, r10, source_next
    SUB r11, 36, r8
    MULDIV r11, r11, 1800, 37
    MUL r12, r10, 384
    ADD r12, r12, r9
    LD r13, r0, r12
    ADD r13, r13, r11
    ST r0, r12, r13
    LD r13, r1, r12
    ADD r13, r13, r11
    ST r1, r12, r13
source_next:
    ADD r6, r6, 1
    BLE r6, 6, source_cell
    ADD r7, r7, 1
    BLE r7, 6, source_row

draw:
    MOV r4, 0
    MOV r6, 0
 draw_row:
    MOV r5, 0
 draw_cell:
    LD r7, r1, r6
    BLE r7, 1000, clamp_low
    MOV r7, 1000
clamp_low:
    BLE -1000, r7, color
    MOV r7, -1000
color:
    BLT r7, 0, negative_color
    MULDIV r8, r7, 245, 1000
    ADD r8, r8, 10
    MULDIV r9, r7, 235, 1000
    ADD r9, r9, 20
    MULDIV r10, r7, 215, 1000
    ADD r10, r10, 40
    JMP put_cell
negative_color:
    SUB r7, 0, r7
    MOV r8, 5
    MULDIV r9, r7, 30, 1000
    ADD r9, r9, 10
    MULDIV r10, r7, 100, 1000
    ADD r10, r10, 25
put_cell:
    PACK r11, r8, r9, r10
    CELL r5, r4, r11
    ADD r6, r6, 1
    ADD r5, r5, 1
    BLT r5, 384, draw_cell
    ADD r4, r4, 1
    BLT r4, 192, draw_row
    FLUSH r30
    BEQ r30, 0, done

    MOV r4, 0
boundary_horizontal:
    ST r2, r4, 0
    ADD r9, r4, 73344
    ST r2, r9, 0
    ADD r4, r4, 1
    BLT r4, 384, boundary_horizontal
    MOV r5, 0
boundary_vertical:
    MUL r9, r5, 384
    ST r2, r9, 0
    ADD r9, r9, 383
    ST r2, r9, 0
    ADD r5, r5, 1
    BLT r5, 192, boundary_vertical

    MOV r5, 1
step_row:
    MOV r4, 1
step_cell:
    MUL r6, r5, 384
    ADD r6, r6, r4
    SUB r9, r6, 1
    LD r7, r1, r9
    ADD r9, r6, 1
    LD r8, r1, r9
    ADD r7, r7, r8
    SUB r9, r6, 384
    LD r8, r1, r9
    ADD r7, r7, r8
    ADD r9, r6, 384
    LD r8, r1, r9
    ADD r7, r7, r8
    DIV r7, r7, 2
    LD r8, r0, r6
    SUB r7, r7, r8
    MULDIV r7, r7, 998, 1000
    ST r2, r6, r7
    ADD r4, r4, 1
    BLT r4, 383, step_cell
    ADD r5, r5, 1
    BLT r5, 191, step_row

    MOV r4, r0
    MOV r0, r1
    MOV r1, r2
    MOV r2, r4
    ADD r3, r3, 1
    JMP frame
done:
    HALT
