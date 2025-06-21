; nes.inc - Macros providing basic ASM6 style directives
; Generate an iNES header and simple padding helpers

; keep header settings
INESPRG_COUNT = 0
INESCHR_COUNT = 0
INESMAP_NUM   = 0
INESMIR_MODE  = 0

MACRO .inesprg count
    INESPRG_COUNT = count
ENDM

MACRO .ineschr count
    INESCHR_COUNT = count
ENDM

MACRO .inesmap num
    INESMAP_NUM = num
ENDM

MACRO .inesmir mode
    INESMIR_MODE = mode
    DB 'N','E','S',$1A
    DB INESPRG_COUNT
    DB INESCHR_COUNT
    DB (INESMAP_NUM << 4) | (INESMIR_MODE & 1)
    DB (INESMAP_NUM & $F0)
    REPT 8
        DB 0
    ENDR
    BASE $8000
ENDM

MACRO .bank num
    ORG $10 + num * $4000
    BASE 0
ENDM

MACRO .dsb size, value
    REPT size
        DB value
    ENDR
ENDM
