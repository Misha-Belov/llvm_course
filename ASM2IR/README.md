# ASM2IR

Приложение с волнами на собственной ISA: [инструкции](ISA.md), [ASM](wave.s),
[сгенерированный IR и результаты проверки](results).

Оба режима запускаются через LLVM ExecutionEngine:
`ext` — IR с вызовами эмуляторов, `full` — IR-эквиваленты инструкций.

Сборка, запуск и проверка из корня репозитория:

```bash
make asm2ir
ASM2IR/build/asm2ir ext ASM2IR/wave.s --frames 3
ASM2IR/build/asm2ir full ASM2IR/wave.s --frames 3
make check-asm2ir
```

Нужны CMake, C/C++, LLVM dev и Python 3. Для окна — `libsdl2-dev` и параметры
`--sdl --frames 0`; для сохранения IR — `--dump output.ll`.
