;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Challenge menu - Score bar / background color code
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Change score bar so each pixel represents more points, to compensate for
; higher level count

; Tentatively:
; 15,000 * 96 + 14,000 * 40 = 2,000,000  (phase transition at 1,440,000)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.define ScoreBarPerPixelA     1500  ; fixed-point (mult by 10 for actual score)
.define ScoreBarPerPixelB     1400  ; fixed-point (mult by 10 for actual score)
.define ScoreBarPxThreshold   96    ; use A until this pixel count, B after

.bank $11 slot 1

.orga $546E
.section "CalcScoreBarPixels" size $5493-$546E overwrite
@PixelLoopA:
    ld   a,e
    sub  ScoreBarPerPixelA & $FF
    ld   e,a
    ld   a,d
    sbc  (ScoreBarPerPixelA & $FF00) >> 8
    ld   d,a
    ld   a,c
    sbc  ScoreBarPerPixelA >> 16
    ld   c,a
    jr   c,@Break
    inc  b
    ld   a,b
    cp   ScoreBarPxThreshold
    jr   c,@PixelLoopA
@PixelLoopB:
    ld   a,e
    sub  ScoreBarPerPixelB & $FF
    ld   e,a
    ld   a,d
    sbc  (ScoreBarPerPixelB & $FF00) >> 8
    ld   d,a
    ld   a,c
    sbc  ScoreBarPerPixelB >> 16
    ld   c,a
    jr   c,@Break
    inc  b
    jr   @PixelLoopB
@Break:
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Change background color calculation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $11 slot 1

; Replace BG color checks during challenge menu load

.orga $5367
.section "Calc BG color on load" size $5389-$5367 overwrite
; check if pixel count is *at least* any threshold
    ld   a,[W_ChalScoreBarPixels]
    ld   e,ChalMenu_BGThresholds@End-ChalMenu_BGThresholds  ; loop index
    ld   d,$00
@Loop:
    ld   hl,ChalMenu_BGThresholds-1 ; loop ends when e==0, so use table-1
    add  hl,de
    cp   [hl]
    jp   nc,@SetPalette             ; if number of pixels > threshold, exit loop
    inc  hl
    dec  e
    jr   nz,@Loop                   ; don't loop if e==0
    ret                             ; if no threshold was met, return (keep green BG)

@SetPalette:
    call ChalMenu_SetPalette
    ld   a,[W_ChalScoreBarPixels]
    cp   $88                        ; full bar
    ret  c
    jr   AddCrownTile
.ends
.orga $5389
AddCrownTile:

; Replace BG color checks when incrementing score bar

.orga $5788
.section "Calc BG color from score bar" size $57AA-$5788 overwrite
; check if pixel count is *exactly* any threshold
    ld   a,[W_ChalScoreBarPixels]
    ld   e,ChalMenu_BGThresholds@End-ChalMenu_BGThresholds  ; loop index
    ld   d,$00
@Loop:
    ld   hl,ChalMenu_BGThresholds-1 ; loop ends when e==0, so use table-1
    add  hl,de
    cp   [hl]
    jp   z,@SetPalette              ; if number of pixels == threshold, exit loop
    inc  hl
    dec  e
    jr   nz,@Loop                   ; don't loop if e==0
    jr   Code1157AE                 ; jump if palette was not changed

@SetPalette:
    call ChalMenu_SetPalette
    jr   Code1157AA                 ; jump if palette was changed
.ends
.orga $57AA
Code1157AA:
.orga $57AE
Code1157AE:

; New subroutine to set BG color

.section "ChalMenu_SetBGColor" free
ChalMenu_BGThresholds:
.db $22,$43,$65,$88
;.db $2F,$5B,$88                     ; vanilla thresholds
@End:
ChalMenu_BGPalettes:
.dw $07FF,$061F                     ; orange
.dw $621F,$185F                     ; red
.dw $7F0F,$7D2D                     ; blue
.dw $43FF,$03BF                     ; yellow (new)

ChalMenu_SetPalette:
    ld   hl,ChalMenu_BGPalettes
    dec  e
    sla  e
    sla  e
    add  hl,de
    ld   d,h                        ;\ subroutine expects palette pointer in de
    ld   e,l                        ;/
    jp   $54E0                      ; jump to vanilla subroutine (recycle ret)
.ends
