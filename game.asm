; NES program to display Japanese text "テストナカシマ"
; Assemble with ASM6 to create a .nes file

        .inesprg 1      ; 16KB PRG
        .ineschr 1      ; 8KB CHR
        .inesmap 0      ; Mapper 0 (NROM)
        .inesmir 1      ; Vertical mirroring

        .org $8000

RESET:
        sei
        cld
        ldx #$40
        stx $4017         ; disable APU frame IRQ
        ldx #$ff
        txs
        inx
        stx $2000
        stx $2001
        stx $4010

; wait for first vblank
vblankwait1:
        bit $2002
        bpl vblankwait1
vblankwait2:
        bit $2002
        bpl vblankwait2

; load palette ($3F00-$3F1F)
        lda #$3F
        sta $2006
        lda #$00
        sta $2006
        ldx #$00
LoadPal:
        lda Palette, x
        sta $2007
        inx
        cpx #32
        bne LoadPal

; load text into nametable ($2000)
        lda #>($214C)
        sta $2006
        lda #<($214C)
        sta $2006
        ldx #0
LoadText:
        lda TextData, x
        sta $2007
        inx
        cpx #TextLength
        bne LoadText

; turn on screen
        lda #%10000000  ; enable NMI
        sta $2000
        lda #%00011110  ; show background, sprites off
        sta $2001

Forever:
        jmp Forever

NMI:
        rti

IRQ:
        rti

Palette:
        .db $0F,$01,$21,$31
        .db $0F,$00,$10,$20
        .db $0F,$00,$10,$20
        .db $0F,$00,$10,$20
        ; sprite palettes (unused)
        .db $0F,$00,$10,$20
        .db $0F,$00,$10,$20
        .db $0F,$00,$10,$20
        .db $0F,$00,$10,$20

TextData:
        .db $00,$01,$02,$03,$04,$05,$06
TextLength = $07

        .org $FFFA
        .dw NMI
        .dw RESET
        .dw IRQ

        ; CHR data bank
        .bank 1
        .org $0000
Tile_Te:
        .db $1E,$04,$0E,$0A,$0A,$0A,$08,$00
        .db $00,$00,$00,$00,$00,$00,$00,$00
Tile_Su:
        .db $3F,$04,$0E,$12,$12,$24,$24,$40
        .db $00,$00,$00,$00,$00,$00,$00,$00
Tile_To:
        .db $3E,$24,$24,$24,$24,$24,$18,$00
        .db $00,$00,$00,$00,$00,$00,$00,$00
Tile_Na:
        .db $06,$0A,$0A,$1F,$0A,$0A,$0A,$0A
        .db $00,$00,$00,$00,$00,$00,$00,$00
Tile_Ka:
        .db $12,$12,$18,$1C,$12,$12,$22,$40
        .db $00,$00,$00,$00,$00,$00,$00,$00
Tile_Shi:
        .db $02,$06,$04,$04,$0C,$0A,$12,$12
        .db $00,$00,$00,$00,$00,$00,$00,$00
Tile_Ma:
        .db $0C,$12,$22,$3E,$12,$12,$12,$12
        .db $00,$00,$00,$00,$00,$00,$00,$00
        .dsb $2000-(*),$00
