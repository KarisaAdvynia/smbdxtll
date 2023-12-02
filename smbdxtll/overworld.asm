;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Overworld code
; Load existing overworlds for W9-WD, and fix level numbers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $11 slot 1

.orga $5E56
.section "display world number" overwrite
    nop                             ;\ remove "and $07"
    nop                             ;/
.ends

; define CalcSPAdjustedLevelID

.orga $66D9
CalcSPAdjustedLevelID:

; Replace calc in CalcSPAdjustedLevelID, to account for more than 8 worlds

.orga $66E3
.section "OWAdjustLevelID jump" overwrite
    jp   OWAdjustLevelID
.ends

.section "OWAdjustLevelID" free
WorldStartOffset:
.db $00,$08,$04,$10,$0C,$18,$14,$1C,\
    $10,$0C,$18,$08,$1C

; E: unadjusted level ID
; adjusted level ID should be returned in DE
OWAdjustLevelID:
    ld   c,e
    srl  c
    srl  c                          ; c = 0-indexed world number
    ld   b,$00
    ld   hl,WorldStartOffset
    add  hl,bc
    ld   a,e
    and  $03                        ; a = 0-indexed level number
    add  [hl]                       ; add world offset
    ld   e,a                        ;\ return adjusted level ID in DE
    ld   d,$00                      ;/
    ret
.ends

; Adjusted level ID calculation is hardcoded at $11:5DA2
; Replace hardcoding with subroutine call
; Also set hard mode flag if world A+

.orga $5DA2
.section "OWTilemapIndex" size $5DC3-$5DA2 overwrite
    ld   hl,W_HardFlag
    xor  a                          ;\ clear hard flag by default
    ld   [hl],a                     ;/
    ld   a,[W_LevelID]              ;\
    cp   $24                        ;|
    jr   c,+                        ;|
    inc  [hl]                       ;/ if level A-1 or later, set hard flag
+

    call CalcSPAdjustedLevelID      ; replace hardcoding with call 
    ld   b,e                        ;\
    srl  b                          ;| b = 0-indexed adjusted world number
    srl  b                          ;/
    jr   SkipOWTilemapIndex
.ends

.orga $5DC3
SkipOWTilemapIndex:

; Code to add/remove SP overworld bridges in W2/W3

.orga $5DE5
.section "add/remove overworld bridges" overwrite
    and $FC                         ; filter more world bits than $1C
.ends
