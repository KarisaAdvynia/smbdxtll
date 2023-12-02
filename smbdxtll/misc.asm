;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code that didn't fit into another file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; When loading challenge mode menu, set Super Players flag and unlock all levels

.bank $11 slot 1

.orga $4D6D
.section "ChalMenuFromMainMenu jump" size 5 overwrite
    jp   ChalMenuFromMainMenu
    nop
    nop
ChalMenuFromMainMenu_Return:
.ends

.section "ChalMenuFromMainMenu" free
ChalMenuFromMainMenu:
    ld   a,$FF                      ;\
    ld   hl,W_ChalUnlockFlagsP0     ;| unlock 1-1 to 8-4
    ldi  [hl],a                     ;|
    ldi  [hl],a                     ;|
    ldi  [hl],a                     ;|
    ldi  [hl],a                     ;/
    ld   a,$1F                      ;\
    ld   hl,W_ChalUnlockFlagsP1     ;| unlock 9-1 to D-4
    ldi  [hl],a                     ;|
    ldi  [hl],a                     ;|
    ldi  [hl],a                     ;|
    ldi  [hl],a                     ;/
    xor  a                          ;\
    ld   [W_ChalPage],a             ;/ start on page 0
    ld   a,$01                      ;\
    ld   [W_SPFlag],a               ;/ set Super Players flag
    ld   [W_ChallengeFlag],a        ; replaced
    jp   ChalMenuFromMainMenu_Return
.ends

; Remap pause screen level number, to make room for A-D tiles

.bank $04 slot 1

.orga $4C73
.section "Pause screen level number" overwrite
    or   $20
.ends

; Disable hard mode hardcoding to replace Goombas by Buzzy Beetles

.bank $00 slot 0

.orga $2D08
.section "Disable Goomba->Buzzy hardcoding" size $2D15-$2D08 overwrite
    jr DontReplaceGoombas
.ends

.orga $2D15
DontReplaceGoombas:
