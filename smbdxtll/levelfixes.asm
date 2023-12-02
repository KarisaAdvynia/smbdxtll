;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level fixes
; Converting Super Players levels to be functional in Challenge mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Remap challenge mode tables to account for Super Players' higher sublevel count

.bank $00 slot 0
.orga $37B6
.section "Challenge object pointers" overwrite
    ld   a,:ChObjPtrs
    call SetROMBank   
    ld   hl,ChObjPtrs
.ends

.orga $398C
.section "Challenge red coin pointers" overwrite
    ld   a,:ChRedCoinPtrs
    call SetROMBank   
    ld   hl,ChRedCoinPtrs
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Edit hardcoded positions where Mario stops moving after flagpoles

.bank $03 slot 1
.orga $4B85
.section "FlagVictory_SkipSPCheck" size $4B91-$4B85 overwrite
    ld   hl,FlagVictory_PlayerStopXLow
    jr   FlagVictory_SkipSPCheck
.ends
.orga $4B91
FlagVictory_SkipSPCheck:

.orga $4B2E
.section "FlagVictory_PlayerStopXLow" size $40 overwrite
FlagVictory_PlayerStopXLow:
.db $10,$10,$F0,$00   ; World 1
.db $C0,$B0,$70,$00   ; World 2
.db $F0,$10,$00,$00   ; World 3
.db $C0,$50,$00,$00   ; World 4
.db $00,$10,$50,$00   ; World 5
.db $A0,$10,$F0,$00   ; World 6
.db $00,$60,$20,$00   ; World 7
.db $D0,$F0,$C0,$00   ; World 8 
.db $D0,$F0,$C0,$80   ; World 9
.db $80,$10,$A0,$00   ; World A
.db $E0,$10,$00,$00   ; World B
.db $B0,$70,$30,$00   ; World C
.db $E0,$80,$10,$00   ; World D
.ends

.bank $07 slot 1
.orga $4B6E
.section "FlagpoleFGBrick_SkipSPCheck" size $4B7A-$4B6E overwrite
    ld   hl,FlagpoleFGBrickRelX
    jr   FlagpoleFGBrick_SkipSPCheck
.ends
.orga $4B7A
FlagpoleFGBrick_SkipSPCheck:

.orga $4ADC
.section "FlagpoleFGBrickRelX" size $40 overwrite
FlagpoleFGBrickRelX:
.db $67,$67,$67,$00   ; World 1
.db $57,$67,$77,$00   ; World 2
.db $67,$67,$77,$00   ; World 3
.db $67,$67,$77,$00   ; World 4
.db $67,$67,$77,$00   ; World 5
.db $67,$67,$67,$00   ; World 6
.db $67,$47,$77,$00   ; World 7
.db $67,$57,$67,$00   ; World 8 
.db $67,$67,$57,$67   ; World 9
.db $67,$67,$87,$00   ; World A
.db $67,$67,$77,$00   ; World B
.db $57,$57,$77,$00   ; World C
.db $67,$57,$77,$00   ; World D
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Replace hardcoded X positions where Mario stops moving, after the axe in castles

.bank $03 slot 1
.orga $503E
.section "AxeVictory_PlayerStopX auto-calculate" size $5070-$503E overwrite
    ldh  a,[<H_PlayerXHigh]         ;\ Set stop position high byte
    inc  a                          ;| to player X high, +1
    ld   [$C267],a                  ;/
    ld   a,[W_ChallengeFlag] 
    and  a                   
    jr   nz,@Challenge
    ld   a,$50                      ;\ Non-challenge:
    ld   [$C265],a                  ;/ Always use $50 for low byte
    ret
@Challenge:
    ld   a,$60                      ;\ Challenge:
    ld   [$C265],a                  ;/ Always use $60 for low byte
    ret
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Fix invisible timer in 1-1 pipe bonus

.bank $00 slot 0

.orga $3B96
.section "Always show timer" overwrite
    jr DispTimer
.ends

.orga $3B9D
DispTimer:
