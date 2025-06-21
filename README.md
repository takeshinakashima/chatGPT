# chatGPT

This repository contains sample files for experiments with Famicom development.

- `test.asm` demonstrates how to display the Japanese text "テストナカシマ" on the screen using the ASM6 assembler.

To build the ROM, run:

```bash
asm6 test.asm test.nes
```

Then open `test.nes` with FCEUX to verify the text appears.
