# chatGPT

This repository contains sample files for experiments with Famicom development.

- `src/game.asm` demonstrates how to display the Japanese text "テストナカシマ" on the screen using the ASM6 assembler.

To build the ROM manually, run:

```bash
asm6 src/game.asm game.nes
```

`asm6.exe` must be placed in the repository root. You can also run `build.bat`, which calls `asm6.exe src\game.asm game.nes` for you. If the assembler complains about missing macros, download `nes.inc` and place it next to the sources.

Then open `game.nes` with FCEUX to verify the text appears.
