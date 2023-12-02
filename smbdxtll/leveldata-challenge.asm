;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level data - Challenge mode objects and high scores
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Remap high score target table

.bank $11 slot 1

.orga $5EBB
.section "ld HighScoreTargets" overwrite
    ld   hl,HighScoreTargets        ; 11:5EBB
.ends
.section "HighScoreTargets" free
HighScoreTargets:
.dl 7500, 3200, 3100, 1450   ; World 1
.dl 4200, 6500, 2900, 4100   ; World 2
.dl 4600, 2200, 5500, 2100   ; World 3
.dl 3800, 5200, 2600, 1400   ; World 4
.dl 7700, 3200, 2700, 1250   ; World 5
.dl 5300, 2100, 3100, 1650   ; World 6
.dl 5500, 2800, 1900, 4600   ; World 7
.dl 3700, 4800, 3500, 2500   ; World 8
.dl 2048, 2111, 3276, 2390   ; World 9
.dl 9999, 9999, 9999, 9999   ; World A
.dl 9999, 9999, 9999, 9999   ; World B
.dl 9999, 9999, 9999, 9999   ; World C
.dl 9999, 9999, 9999, 9999   ; World D
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Add challenge mode data

.bank $12 slot 1
.section "Challenge object data" free
ChObjPtrs:
.dw ChObj_1_1_Main                  ; sublevel 00
.dw ChObj_1_2_Main                  ; sublevel 01
.dw ChObj_1_3                       ; sublevel 02
.dw ChObj_1_4                       ; sublevel 03
.dw ChObj_2_1_Main                  ; sublevel 04
.dw ChObj_2_2_Main                  ; sublevel 05
.dw ChObj_2_3                       ; sublevel 06
.dw ChObj_2_4                       ; sublevel 07
.dw ChObj_3_1_Main                  ; sublevel 08
.dw ChObj_3_2_Main                  ; sublevel 09
.dw ChObj_3_3                       ; sublevel 0A
.dw ChObj_3_4                       ; sublevel 0B
.dw ChObj_4_1_Main                  ; sublevel 0C
.dw ChObj_4_2_Main                  ; sublevel 0D
.dw ChObj_4_3                       ; sublevel 0E
.dw ChObj_4_4                       ; sublevel 0F
.dw ChObj_5_1_Main                  ; sublevel 10
.dw ChObj_5_2_Main                  ; sublevel 11
.dw ChObj_5_3_1                     ; sublevel 12
.dw ChObj_5_4                       ; sublevel 13
.dw ChObj_6_1_Main                  ; sublevel 14
.dw ChObj_6_2_Main                  ; sublevel 15
.dw ChObj_6_3                       ; sublevel 16
.dw ChObj_6_4                       ; sublevel 17
.dw ChObj_7_1_Main                  ; sublevel 18
.dw ChObj_7_2_1                     ; sublevel 19
.dw ChObj_7_3                       ; sublevel 1A
.dw ChObj_7_4                       ; sublevel 1B
.dw ChObj_8_1_Main                  ; sublevel 1C
.dw ChObj_8_2_Main                  ; sublevel 1D
.dw ChObj_8_3_Main                  ; sublevel 1E
.dw ChObj_8_4_1                     ; sublevel 1F
.dw ChObj_9_1_Intro                 ; sublevel 20
.dw ChObj_9_2                       ; sublevel 21
.dw ChObj_9_3_Main                  ; sublevel 22
.dw ChObj_9_4                       ; sublevel 23
.dw ChNullObjData                   ; sublevel 24
.dw ChNullObjData                   ; sublevel 25
.dw ChNullObjData                   ; sublevel 26
.dw ChObj_A_4                       ; sublevel 27
.dw ChNullObjData                   ; sublevel 28
.dw ChNullObjData                   ; sublevel 29
.dw ChNullObjData                   ; sublevel 2A
.dw ChObj_B_4                       ; sublevel 2B
.dw ChNullObjData                   ; sublevel 2C
.dw ChNullObjData                   ; sublevel 2D
.dw ChNullObjData                   ; sublevel 2E
.dw ChObj_C_4                       ; sublevel 2F
.dw ChNullObjData                   ; sublevel 30
.dw ChNullObjData                   ; sublevel 31
.dw ChNullObjData                   ; sublevel 32
.dw ChNullObjData                   ; sublevel 33
.dw ChObj_1_1_PipeBonus             ; sublevel 34
.dw ChObj_1_2_W3Warp                ; sublevel 35
.dw ChObj_1_2_W4Warp                ; sublevel 36
.dw ChObj_1_2_PipeBonus             ; sublevel 37
.dw ChNullObjData                   ; sublevel 38
.dw ChNullObjData                   ; sublevel 39
.dw ChNullObjData                   ; sublevel 3A
.dw ChNullObjData                   ; sublevel 3B
.dw ChObj_3_1_CloudBonus            ; sublevel 3C
.dw ChObj_3_1_PipeBonus             ; sublevel 3D
.dw ChObj_4_1_WaterBonus            ; sublevel 3E
.dw ChNullObjData                   ; sublevel 3F
.dw ChObj_4_2_PipeBonus             ; sublevel 40
.dw ChObj_5_1_PipeBonus             ; sublevel 41
.dw ChNullObjData                   ; sublevel 42
.dw ChNullObjData                   ; sublevel 43
.dw ChNullObjData                   ; sublevel 44
.dw ChObj_5_3_2                     ; sublevel 45
.dw ChObj_5_3_3                     ; sublevel 46
.dw ChNullObjData                   ; sublevel 47
.dw ChNullObjData                   ; sublevel 48
.dw ChObj_7_1_PipeBonus2            ; sublevel 49
.dw ChObj_7_2_2                     ; sublevel 4A
.dw ChObj_7_2_3                     ; sublevel 4B
.dw ChObj_8_1_WaterRoom             ; sublevel 4C
.dw ChNullObjData                   ; sublevel 4D
.dw ChObj_8_2_PipeRoom              ; sublevel 4E
.dw ChObj_8_2_Goal                  ; sublevel 4F
.dw ChObj_8_3_CloudBonus            ; sublevel 50
.dw ChObj_8_4_2                     ; sublevel 51
.dw ChNullObjData                   ; sublevel 52
.dw ChObj_8_4_4                     ; sublevel 53
.dw ChObj_8_4_5                     ; sublevel 54
.dw ChObj_9_1_Main                  ; sublevel 55
.dw ChObj_9_3_CloudBonus            ; sublevel 56
.dw ChNullObjData                   ; sublevel 57
.dw ChNullObjData                   ; sublevel 58
.dw ChNullObjData                   ; sublevel 59
.dw ChNullObjData                   ; sublevel 5A
.dw ChNullObjData                   ; sublevel 5B
.dw ChNullObjData                   ; sublevel 5C
.dw ChNullObjData                   ; sublevel 5D
.dw ChNullObjData                   ; sublevel 5E
.dw ChNullObjData                   ; sublevel 5F
.dw ChNullObjData                   ; sublevel 60
.dw ChObj_D_4_4                     ; sublevel 61
.dw ChNullObjData                   ; sublevel 62
.dw ChNullObjData                   ; sublevel 63

ChObj_1_1_Main:      ; 0D screens
.db $FF
.db $01,$72,$78,$FF  ; 01: brick with red coin
.db $FF
.db $FF
.db $01,$B8,$7A,$FF  ; 04: multi-coin brick with red coin
.db $01,$BC,$77,$FF  ; 05: ? block with red coin
.db $FF
.db $FF
.db $01,$70,$78,$FF  ; 08: brick with red coin
.db $01,$43,$56,$FF  ; 09: red coin
.db $FF
.db $FF
.db $FF
ChObj_1_1_PipeBonus: ; 01 screen
.db $01,$84,$7F,$FF  ; 00: hidden Yoshi egg

ChObj_1_2_Main:      ; 0E screens
.db $FF
.db $01,$57,$56,$FF  ; 01: red coin
.db $FF
.db $01,$EF,$56,$FF  ; 03: red coin
.db $FF
.db $FF
.db $01,$BE,$78,$FF  ; 06: brick with red coin
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
ChObj_1_2_W3Warp:    ; 04 screens
.db $FF
.db $FF
.db $FF
.db $88,$C4,$00, $01,$B4,$7F, $FF  ; 03: BG tree + hidden Yoshi egg
ChObj_1_2_W4Warp:    ; 06 screens
.db $FF
.db $01,$E9,$56,$FF  ; 01: red coin
.db $FF
.db $FF
.db $FF
.db $FF
ChObj_1_2_PipeBonus: ; 02 screens
.db $FF
.db $01,$7A,$7A,$FF  ; 01: multi-coin brick with red coin

ChObj_1_3:           ; 0C screens
.db $FF
.db $FF
.db $01,$DD,$56,$FF  ; 02: red coin
.db $FF
.db $01,$C0,$56,$FF  ; 04: red coin
.db $01,$CA,$56,$FF  ; 05: red coin
.db $01,$43,$56,$FF  ; 06: red coin
.db $FF
.db $FF
.db $01,$C2,$56,$FF  ; 09: red coin
.db $81,$91,$01, $81,$C1,$01, $81,$E1,$01,   ; 0A: 3 BG clouds
.db $01,$F3,$4E, $01,$B2,$7F, $FF            ;     + repair ground + hidden Yoshi egg
.db $FF

ChObj_1_4:           ; 0A screens
.db $FF
.db $01,$5D,$56,$FF  ; 01: red coin
.db $FF
.db $01,$B0,$7F, $01,$DA,$56, $FF  ; 03: hidden Yoshi egg (in platform) + red coin
.db $FF
.db $FF
.db $01,$B3,$56, $01,$5F,$56, $FF  ; 06: 2 red coins
.db $FF
.db $01,$A9,$56,$FF  ; 08: red coin
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; 09: castle doorway

ChObj_2_1_Main:      ; 10 screens
.db $FF
.db $01,$E3,$13, $01,$D4,$13, $01,$C5,$13, $01,$85,$7F, $FF  ; 01: hill fragment + hidden Yoshi egg
.db $FF
.db $FF
.db $01,$A5,$56,$FF  ; 04: red coin
.db $FF
.db $FF
.db $01,$D4,$56,$FF  ; 07: red coin
.db $01,$B9,$79,$FF  ; 08: hidden block with red coin
.db $01,$B5,$77,$FF  ; 09: ? block with red coin
.db $FF
.db $01,$60,$56,$FF  ; 0B: red coin
.db $FF
.db $FF
.db $FF
.db $FF

ChObj_2_2_Main:      ; 10 screens
.db $01,$B0,$0B, $01,$A0,$7F  ; 00: cloud fragment + hidden Yoshi egg
.db $01,$80,$0A, $01,$81,$0B, $01,$90,$0D, $01,$91,$0E, $FF  ; + another cloud above
.db $FF
.db $FF
.db $FF
.db $FF
.db $01,$67,$56,$FF  ; 05: red coin
.db $01,$D6,$56,$FF  ; 06: red coin
.db $FF
.db $FF
.db $FF
.db $01,$BD,$7A,$FF  ; 0A: multi-coin brick with red coin
.db $01,$AD,$56,$FF  ; 0B: red coin
.db $FF
.db $FF
.db $FF
.db $01,$B7,$56,$FF  ; 0F: red coin
.db $FF
.db $FF

ChObj_2_3:           ; 0D screens
.db $FF
.db $FF
.db $FF
.db $01,$D5,$56,$FF  ; 03: red coin
.db $01,$67,$56,$FF  ; 04: red coin
.db $01,$71,$77,$FF  ; 05: ? block with red coin
.db $81,$AC,$01, $03,$BC,$33, $01,$7D,$7F, $FF  ; 06: BG cloud + repair platform + hidden Yoshi egg
.db $FF
.db $01,$76,$56,$FF  ; 08: red coin
.db $FF
.db $01,$51,$56,$FF  ; 0A: red coin
.db $FF
.db $FF

ChObj_2_4:           ; 0A screens
.db $01,$7F,$56,$FF  ; 00: red coin
.db $FF
.db $01,$9D,$56,$FF  ; 02: red coin
.db $FF
.db $01,$52,$56,$FF  ; 04: red coin
.db $01,$B1,$56,$FF  ; 05: red coin
.db $01,$7B,$7F, $01,$FB,$02, $FF  ; 06: hidden Yoshi egg + suspicious block below
.db $FF
.db $01,$82,$7A, $01,$72,$03, $FF  ; 08: multi-coin brick with red coin + gap above
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; 09: castle doorway

ChObj_3_1_Main:      ; 10 screens
.db $FF
.db $FF
.db $01,$7E,$77,$FF  ; 02: ? block with red coin
.db $01,$5B,$56,$FF  ; 03: red coin
.db $43,$C6,$42, $01,$B6,$7F, $FF  ; 04: fence + hidden Yoshi egg
.db $FF
.db $FF
.db $FF
.db $FF
.db $01,$4E,$56,$FF  ; 09: red coin
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
ChObj_3_1_PipeBonus: ; 01 screen
.db $01,$55,$56,$FF  ; 00: red coin
ChObj_3_1_CloudBonus:; 07 screens
.db $FF
.db $FF
.db $01,$71,$56,$FF  ; 02: red coin
.db $FF
.db $FF
.db $FF
.db $FF

ChObj_3_2_Main:      ; 0C screens
.db $FF
.db $42,$E6,$2E, $01,$76,$7F, $FF  ; 01: new coral + hidden Yoshi egg
.db $FF
.db $01,$68,$56,$FF  ; 03: red coin
.db $FF
.db $01,$F2,$56,$FF  ; 05: red coin
.db $FF
.db $01,$54,$56,$FF  ; 07: red coin
.db $FF
.db $01,$DC,$56,$FF  ; 09: red coin
.db $FF
.db $01,$D5,$56,$FF  ; 0B: red coin

ChObj_3_3:           ; 0D screens
.db $FF
.db $01,$C0,$56,$FF  ; 01: red coin
.db $01,$44,$56,$FF  ; 02: red coin
.db $FF
.db $FF
.db $01,$4E,$56, $01,$BF,$7F    ; 05: red coin + hidden Yoshi egg +
.db $03,$DE,$03, $01,$EE,$09, $01,$EF,$0A, $FF  ; cover old cloud + new cloud
.db $01,$E0,$0B, $FF  ; 06: right edge of 05's cloud
.db $FF
.db $01,$EC,$56,$FF  ; 08: red coin
.db $FF
.db $01,$98,$56,$FF  ; 0A: red coin
.db $FF
.db $FF
.db $FF

ChObj_3_4:           ; 0C screens
.db $FF
.db $01,$62,$56,$FF  ; 01: red coin
.db $FF
.db $FF
.db $01,$E3,$56,$FF  ; 04: red coin
.db $FF
.db $01,$B1,$79,$FF  ; 06: hidden block with red coin
.db $01,$E4,$56,$FF  ; 07: red coin
.db $FF
.db $01,$B4,$7F, $01,$DC,$56, $FF  ; 09: hidden Yoshi egg (in platform) + red coin
.db $FF
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; 0B: castle doorway

ChObj_4_1_Main:      ; 0E screens
.db $FF
.db $FF
.db $01,$62,$79,$FF  ; 02: hidden block with red coin
.db $FF
.db $01,$61,$56,$FF  ; 04: red coin
.db $FF
.db $FF
.db $01,$ED,$56,$FF  ; 07: red coin
.db $FF
.db $01,$4D,$56,$FF  ; 09: red coin
.db $FF
.db $01,$BD,$7F, $01,$ED,$10, $01,$EE,$11, $FF  ; 0B: hidden Yoshi egg + bush below
.db $FF
.db $FF
ChObj_4_1_WaterBonus:; 05 screens
.db $FF
.db $FF
.db $01,$68,$56,$FF  ; 02: red coin
.db $FF
.db $FF

ChObj_4_2_Main:      ; 0E screens
.db $FF
.db $02,$E7,$03, $01,$E8,$56, $FF  ; 01: cover up bush fragment + red coin
.db $FF
.db $FF
.db $01,$70,$78,  ; 04: brick with red coin
.db $01,$B8,$7E, $81,$97,$01, $FF  ; + brick with Yoshi egg + BG cloud
.db $FF
.db $FF
.db $FF
.db $01,$B1,$77, $01,$DE,$7A, $FF  ; 08: ? block with red coin + multi-coin brick with red coin
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF

ChObj_4_2_PipeBonus: ; 01 screen
.db $01,$45,$78,$FF  ; 04: brick with red coin

ChObj_4_3:           ; 0D screens
.db $FF
.db $FF
.db $01,$C0,$56,$FF  ; 02: red coin
.db $01,$BC,$56,$FF  ; 03: red coin
.db $FF
.db $01,$69,$56,$FF  ; 05: red coin
.db $FF
.db $01,$95,$56,$FF  ; 07: red coin
.db $FF
.db $01,$67,$56,$FF  ; 09: red coin
.db $01,$85,$7F, $81,$94,$01, $81,$B4,$01, $01,$E3,$09, $03,$E4,$0A, $01,$E7,$0B, $FF  ; 0A: hidden Yoshi egg + 3 clouds below
.db $FF
.db $FF

ChObj_4_4:           ; 0E screens
.db $FF
.db $01,$B6,$77,$FF  ; 01: ? block with red coin
.db $FF
.db $01,$97,$56,$FF  ; 03: red coin
.db $FF
.db $01,$A0,$56, $01,$EB,$56, $FF  ; 05: 2 red coins
.db $01,$72,$7E,$FF  ; 06: brick with Yoshi egg
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $01,$88,$56,$FF  ; 0C: red coin
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; 0D: castle doorway

ChObj_5_1_Main:      ; 18 screens
.db $FF
.db $FF
.db $FF
.db $01,$95,$56,$FF  ; 03: red coin
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $01,$B6,$7F, $43,$C6,$42, $FF  ; 0A: hidden Yoshi egg + BG fence
.db $FF
.db $01,$70,$56,$FF  ; 0C: red coin
.db $FF
.db $FF
.db $01,$8B,$56,$FF  ; 0F: red coin
.db $FF
.db $FF
.db $01,$77,$78,$FF  ; 12: brick with red coin
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
ChObj_5_1_PipeBonus: ; 01 screen
.db $01,$4C,$7A,$FF  ; 00: multi-coin brick with red coin

ChObj_5_2_Main:      ; 0D screens
.db $01,$51,$56,$FF  ; 00: red coin
.db $FF
.db $FF
.db $01,$E5,$56,$FF  ; 03: red coin
.db $FF
.db $01,$B1,$78,$FF  ; 05: brick with red coin
.db $FF
.db $01,$4F,$7E, $01,$8F,$04, $01,$BF,$7A, $FF  ; 07: brick with Yoshi egg + another brick below + multi-coin brick with red coin below that
.db $01,$FF,$56,$FF  ; 08: red coin
.db $FF
.db $FF
.db $FF
.db $FF

ChObj_5_3_1:         ; 06 screens
.db $FF
.db $FF
.db $01,$BE,$56,$FF  ; 02: red coin
.db $01,$EA,$56,$FF  ; 03: red coin
.db $FF
.db $FF
ChObj_5_3_2:         ; 02 screens
.db $FF
.db $01,$4D,$7E, $01,$7E,$3E, $01,$AE,$04, $FF  ; 01: brick Yoshi egg + hidden block + brick
;.db $01,$8E,$56,$FF  ; 01: red coin
ChObj_5_3_3:         ; 08 screens
.db $FF
.db $FF
.db $01,$65,$56,$FF  ; 02: red coin
.db $FF
.db $01,$DF,$56,$FF  ; 04: red coin
.db $01,$8E,$56,$FF  ; 05: red coin
.db $FF
.db $FF

ChObj_5_4:           ; 0E screens
.db $FF
.db $FF
.db $01,$52,$56,$FF  ; 02: red coin
.db $01,$C2,$56,$FF  ; 03: red coin
.db $FF
.db $01,$ED,$56,$FF  ; 05: red coin
.db $FF
.db $01,$86,$56,$FF  ; 07: red coin
.db $FF
.db $FF
.db $FF
.db $01,$B1,$7F,$FF  ; 0B: hidden Yoshi egg
.db $01,$57,$56,$FF  ; 0C: red coin
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; 0D: castle doorway

ChObj_6_1_Main:      ; 11 screens
.db $FF
.db $01,$63,$56,$FF  ; 01: red coin
.db $FF
.db $FF
.db $FF
.db $01,$66,$56,$FF  ; 05: red coin
.db $01,$56,$56,$FF  ; 06: red coin
.db $FF
.db $01,$B8,$7A,$FF  ; 08: multi-coin brick with red coin
.db $FF
.db $FF
.db $FF
.db $FF
.db $81,$76,$01, $02,$74,$03, $02,$84,$03  ; 0E: BG cloud + cover old BG cloud
.db $01,$97,$7F, $81,$A6,$01, $FF          ; + hidden Yoshi egg + another BG cloud
.db $01,$62,$56,$FF  ; 0E: red coin
.db $FF
.db $FF

ChObj_6_2_Main:      ; 0C screens
.db $FF
.db $01,$E5,$56,$FF  ; 01: red coin
.db $FF
.db $01,$A7,$56,$FF  ; 03: red coin
.db $FF
.db $01,$BC,$56, $01,$5E,$56, $FF  ; 05: 2 red coins
.db $FF
.db $FF
.db $01,$54,$56,$FF  ; 08: red coin
.db $FF
.db $01,$7B,$7F, $01,$BB,$2E, $FF  ; 0A: hidden Yoshi egg + new coral below
.db $FF
.db $FF

ChObj_6_3:           ; 10 screens
.db $FF
.db $FF
.db $01,$75,$56,$FF  ; 02: red coin
.db $FF
.db $FF
.db $01,$68,$56,$FF  ; 05: red coin
.db $FF
.db $01,$81,$56,$FF  ; 07: red coin
.db $03,$73,$03, $81,$83,$01       ; 08: shift old BG cloud 1 tile down
.db $01,$74,$3E, $01,$44,$7F, $FF  ; + hidden block + hidden Yoshi egg above
.db $FF
.db $01,$D3,$56,$FF  ; 0A: red coin
.db $FF
.db $01,$85,$56,$FF  ; 0C: red coin
.db $FF
.db $FF
.db $FF

ChObj_6_4:           ; 0E screens
.db $FF
.db $FF
.db $01,$A0,$56,$FF  ; 02: red coin
.db $FF
.db $01,$72,$56,$FF  ; 04: red coin
.db $FF
.db $FF
.db $01,$B2,$56, $01,$4D,$56, $FF  ; 07: 2 red coins
.db $FF
.db $01,$7A,$7F, $01,$BA,$04, $FF  ; 09: hidden Yoshi egg + ordinary brick below
.db $01,$E5,$56,$FF  ; 0A: red coin
.db $FF
.db $FF
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; 0D: castle doorway

ChObj_7_1_Main:      ; 15 screens
.db $FF
.db $FF
.db $FF
.db $01,$70,$78,$FF  ; 03: brick with red coin
.db $FF
.db $FF
.db $FF
.db $01,$67,$56,$FF  ; 07: red coin
.db $FF
.db $FF
.db $FF
.db $01,$CD,$56,$FF  ; 0B: red coin
.db $FF
.db $FF
.db $01,$71,$56,$FF  ; 0E: red coin
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $01,$3F,$7F, $88,$4F,$00, $FF  ; 14: off-screen hidden Yoshi egg + BG round tree
ChObj_7_1_PipeBonus2:; 02 screens
.db $01,$82,$56,$FF  ; 00: red coin
.db $FF

ChObj_7_2_1:         ; 06 screens
.db $FF
.db $FF
.db $03,$CE,$03, $03,$DE,$03, $81,$CC,$01, $01,$50,$56, $01,$CF,$56, $FF  ; 02: move cloud 2 tiles left + 2 red coins
.db $FF
.db $FF
.db $FF
ChObj_7_2_2:         ; 01 screen
.db $01,$A4,$78,$FF  ; 00: brick with red coin
ChObj_7_2_3:         ; 08 screens
.db $FF
.db $FF
.db $01,$7C,$7F, $81,$BB,$01, $03,$CB,$18, $FF  ; 02: hidden Yoshi egg + cloud below + fix platform
.db $FF
.db $01,$C0,$56,$FF  ; 04: red coin
.db $01,$D9,$56,$FF  ; 05: red coin
.db $FF
.db $FF

ChObj_7_3:           ; 15 screens
.db $FF
.db $FF
.db $FF
.db $01,$E1,$56,$FF  ; 03: red coin
.db $FF
.db $FF
.db $01,$42,$56,$FF  ; 06: red coin
.db $81,$D7,$01, $81,$79,$01, $02,$7A,$18, $01,$BA,$7F, $FF  ; 07: 2 BG clouds + replace solid blocks + hidden Yoshi egg
.db $FF
.db $01,$EF,$56,$FF  ; 09: red coin
.db $FF
.db $FF
.db $FF
.db $01,$C3,$56,$FF  ; 0D: red coin
.db $FF
.db $FF
.db $FF
.db $01,$A6,$56,$FF  ; 11: red coin
.db $FF
.db $FF
.db $FF

ChObj_7_4:           ; 10 screens
.db $FF
.db $FF
.db $01,$7C,$56,$FF  ; 02: red coin
.db $FF
.db $01,$77,$56,$FF  ; 04: red coin
.db $FF
.db $FF
.db $01,$EF,$56,$FF  ; 07: red coin
.db $FF
.db $FF
.db $01,$B3,$56,$FF  ; 0A: red coin
.db $FF
.db $01,$78,$56,$FF  ; 0C: red coin
.db $FF
.db $01,$85,$7E,$FF  ; 0E: brick with Yoshi egg
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; 0F: castle doorway

ChObj_8_1_Main:      ; 0F screens
.db $FF
.db $FF
.db $01,$B2,$77,$FF  ; 02: ? block with red coin
.db $FF
.db $FF
.db $FF
.db $01,$B8,$7F, $01,$97,$09, $01,$98,$0A, $01,$A7,$0C, $01,$A8,$0D, $01,$D8,$12, $01,$E7,$13, $01,$E8,$14, $01,$E9,$17, $FF  ; 06: hidden Yoshi egg + BG cloud above + BG hill below
.db $FF
.db $01,$69,$56,$FF  ; 08: red coin
.db $FF
.db $01,$67,$56,$FF  ; 0A: red coin
.db $FF
.db $01,$B5,$7A,$FF  ; 0C: multi-coin brick with red coin
.db $FF
.db $FF
ChObj_8_1_WaterRoom: ; 05 screens
.db $FF
.db $FF
.db $01,$88,$56,$FF  ; 02: red coin
.db $FF
.db $FF

ChObj_8_2_Main:      ; 0B screens
.db $FF
.db $FF
.db $01,$5A,$56,$FF  ; 02: red coin
.db $FF
.db $FF
.db $01,$AB,$7A,$FF  ; 05: multi-coin brick with red coin
.db $FF
.db $01,$CA,$78,$FF  ; 07: brick with red coin
.db $FF
.db $FF
.db $01,$5D,$56,$FF  ; 0A: red coin
ChObj_8_2_PipeRoom:  ; 02 screens
.db $FF
.db $01,$83,$56,$FF  ; 01: red coin
ChObj_8_2_Goal:      ; 03 screens
.db $01,$B0,$7F, $01,$E0,$0A, $01,$E1,$0B, $FF  ; 00: hidden Yoshi egg + BG cloud
.db $FF
.db $FF

ChObj_8_3_Main:      ; 0F screens
.db $FF
.db $FF
.db $01,$E4,$56, $01,$FE,$56, $FF  ; 02: 2 red coins
.db $FF
.db $FF
.db $01,$6B,$56,$FF  ; 05: red coin
.db $FF
.db $FF
.db $FF
.db $01,$E9,$56,$FF  ; 09: red coin
.db $FF
.db $FF
.db $FF
.db $01,$84,$7F, $01,$B4,$3E  ; 0D: hidden Yoshi egg + hidden block
.db $01,$E3,$09, $01,$E4,$0A, $01,$F3,$0C, $FF  ; + BG cloud
.db $FF
ChObj_8_3_CloudBonus:; 07 screens
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $01,$6A,$56,$FF  ; 05: red coin
.db $FF

ChObj_8_4_1:         ; 05 screens
.db $FF
.db $01,$5C,$56,$FF  ; 01: red coin
.db $FF
.db $FF
.db $FF
ChObj_8_4_2:         ; 03 screens
.db $FF
.db $01,$90,$77,$FF  ; 01: ? block with red coin
.db $FF
ChObj_8_4_4:         ; 0A screens
.db $FF
.db $FF
.db $FF
.db $01,$8D,$56,$FF  ; 03: red coin
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $01,$67,$56,$FF  ; 09: red coin
ChObj_8_4_5:         ; 0A screens
.db $01,$BE,$03, $01,$BF,$7F, $80,$FE,$01, $FF  ; 00: remove hidden block + hidden Yoshi egg + disable pipe
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $01,$54,$56,$FF  ; 08: red coin
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; 09: castle doorway

ChObj_9_1_Intro:     ; 02 screens
.db $FF
.db $01,$E2,$56,$FF  ; 01: red coin

ChObj_9_1_Main:      ; 0B screens
.db $FF
.db $01,$B9,$77,$FF  ; 01: ? block with red coin
.db $FF
.db $01,$4F,$56,$FF  ; 03: red coin
.db $81,$B7,$01, $01,$98,$7F, $FF  ; 04: BG cloud + hidden Yoshi egg
.db $FF
.db $01,$A7,$56,$FF  ; 06: red coin
.db $01,$5A,$56,$FF  ; 07: red coin
.db $FF
.db $FF
.db $FF

ChObj_9_2:      ; 0B screens
.db $FF
.db $01,$86,$56,$FF  ; 01: red coin
.db $01,$57,$56,$FF  ; 02: red coin
.db $FF
.db $01,$F1,$56,$FF  ; 04: red coin
.db $01,$AE,$56,$FF  ; 05: red coin
.db $01,$FE,$56,$FF  ; 06: red coin
.db $01,$CC,$7F, $81,$7B,$01   ; 07: hidden Yoshi egg + BG cloud
.db $01,$DB,$09, $01,$DC,$0A, $01,$EC,$0D, $FF  ; + another BG cloud
.db $FF
.db $FF
.db $FF

ChObj_9_3_Main:      ; 10 screens
.db $FF
.db $FF
.db $01,$52,$56,$FF  ; 02: red coin
.db $FF
.db $01,$40,$56,$FF  ; 04: red coin
.db $FF
.db $FF
.db $01,$C0,$56,$FF  ; 07: red coin
.db $FF
.db $80,$B4,$01,$FF  ; 09: disable pipe to cloud bonus, to prevent farming
.db $FF
.db $FF
.db $01,$86,$56,$FF  ; 0C: red coin
.db $FF
.db $FF
.db $FF

ChObj_9_3_CloudBonus:  ; 05 screens
.db $FF
.db $01,$AF,$7F, $88,$BF,$00, $42,$DF,$42, $FF  ; 01: hidden Yoshi egg + BG tree on BG fence
.db $FF
.db $FF
.db $01,$F2,$56,$FF  ; 04: red coin

ChObj_9_4:           ; 08 screens
.db $01,$50,$56,$FF  ; 00: red coin
.db $FF
.db $01,$8A,$56,$FF  ; 02: red coin
.db $FF
.db $01,$B2,$56,$FF  ; 04: red coin
.db $01,$80,$7F, $01,$D6,$56,$FF  ; 05: hidden Yoshi egg (in "u") + red coin
.db $FF
.db $01,$E0,$56,$FF  ; 07: red coin

; add final screen doorway to remaining x-4 levels
ChObj_B_4:
ChObj_C_4:
.db $FF
.db $FF
.db $FF
.db $FF
ChObj_A_4:
.db $FF
.db $FF
.db $FF
.db $FF
ChObj_D_4_4:
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $FF
.db $10,$F0,$8E, $8E,$C3,$00, $8F,$C5,$00, $8E,$C7,$00, $FF  ; final: castle doorway

ChNullObjData:
.dsb $20, $FF        ; skip 20 screens
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.section "Challenge red coin X positions" free
ChRedCoinPtrs:
.dw ChRedCoin_1_1                   ; level 00
.dw ChRedCoin_1_2                   ; level 01
.dw ChRedCoin_1_3                   ; level 02
.dw ChRedCoin_1_4                   ; level 03
.dw ChRedCoin_2_1                   ; level 04
.dw ChRedCoin_2_2                   ; level 05
.dw ChRedCoin_2_3                   ; level 06
.dw ChRedCoin_2_4                   ; level 07
.dw ChRedCoin_3_1                   ; level 08
.dw ChRedCoin_3_2                   ; level 09
.dw ChRedCoin_3_3                   ; level 0A
.dw ChRedCoin_3_4                   ; level 0B
.dw ChRedCoin_4_1                   ; level 0C
.dw ChRedCoin_4_2                   ; level 0D
.dw ChRedCoin_4_3                   ; level 0E
.dw ChRedCoin_4_4                   ; level 0F
.dw ChRedCoin_5_1                   ; level 10
.dw ChRedCoin_5_2                   ; level 11
.dw ChRedCoin_5_3                   ; level 12
.dw ChRedCoin_5_4                   ; level 13
.dw ChRedCoin_6_1                   ; level 14
.dw ChRedCoin_6_2                   ; level 15
.dw ChRedCoin_6_3                   ; level 16
.dw ChRedCoin_6_4                   ; level 17
.dw ChRedCoin_7_1                   ; level 18
.dw ChRedCoin_7_2                   ; level 19
.dw ChRedCoin_7_3                   ; level 1A
.dw ChRedCoin_7_4                   ; level 1B
.dw ChRedCoin_8_1                   ; level 1C
.dw ChRedCoin_8_2                   ; level 1D
.dw ChRedCoin_8_3                   ; level 1E
.dw ChRedCoin_8_4                   ; level 1F
.dw ChRedCoin_9_1                   ; level 20
.dw ChRedCoin_9_2                   ; level 21
.dw ChRedCoin_9_3                   ; level 22
.dw ChRedCoin_9_4                   ; level 23
.dw ChNullRedCoinData               ; level 24
.dw ChNullRedCoinData               ; level 25
.dw ChNullRedCoinData               ; level 26
.dw ChNullRedCoinData               ; level 27
.dw ChNullRedCoinData               ; level 28
.dw ChNullRedCoinData               ; level 29
.dw ChNullRedCoinData               ; level 2A
.dw ChNullRedCoinData               ; level 2B
.dw ChNullRedCoinData               ; level 2C
.dw ChNullRedCoinData               ; level 2D
.dw ChNullRedCoinData               ; level 2E
.dw ChNullRedCoinData               ; level 2F
.dw ChNullRedCoinData               ; level 30
.dw ChNullRedCoinData               ; level 31
.dw ChNullRedCoinData               ; level 32
.dw ChNullRedCoinData               ; level 33

ChRedCoin_1_1:
.db $1,$2, $4,$8, $5,$C, $8,$0, $9,$3
ChRedCoin_1_2:
.db $1,$7, $3,$F, $6,$E, $1,$9, $1,$A
ChRedCoin_1_3:
.db $2,$D, $4,$0, $5,$A, $6,$3, $9,$2
ChRedCoin_1_4:
.db $1,$D, $3,$A, $6,$3, $6,$F, $8,$9
ChRedCoin_2_1:
.db $4,$5, $7,$4, $8,$9, $9,$5, $B,$0
ChRedCoin_2_2:
.db $5,$7, $6,$6, $A,$D, $B,$D, $F,$7
ChRedCoin_2_3:
.db $3,$5, $4,$7, $5,$1, $8,$6, $A,$1
ChRedCoin_2_4:
.db $0,$F, $2,$D, $4,$2, $5,$1, $8,$2
ChRedCoin_3_1:
.db $2,$E, $3,$B, $0,$5, $2,$1, $9,$E
ChRedCoin_3_2:
.db $3,$8, $5,$2, $7,$4, $9,$C, $B,$5
ChRedCoin_3_3:
.db $1,$0, $2,$4, $5,$E, $8,$C, $A,$8
ChRedCoin_3_4:
.db $1,$2, $4,$3, $6,$1, $7,$4, $9,$C
ChRedCoin_4_1:
.db $2,$2, $4,$1, $7,$D, $9,$D, $2,$8
ChRedCoin_4_2:
.db $1,$8, $4,$0, $8,$1, $8,$E, $0,$5
ChRedCoin_4_3:
.db $2,$0, $3,$C, $5,$9, $7,$5, $9,$7
ChRedCoin_4_4:
.db $1,$6, $3,$7, $5,$0, $5,$B, $C,$8
ChRedCoin_5_1:
.db $3,$5, $0,$C, $C,$0, $F,$B, $12,$7
ChRedCoin_5_2:
.db $0,$1, $3,$5, $5,$1, $7,$F, $8,$F
ChRedCoin_5_3:
.db $2,$E, $3,$A, $2,$5, $4,$F, $5,$E
ChRedCoin_5_4:
.db $2,$2, $3,$2, $5,$D, $7,$6, $C,$7
ChRedCoin_6_1:
.db $1,$3, $5,$6, $6,$6, $8,$8, $E,$2
ChRedCoin_6_2:
.db $1,$5, $3,$7, $5,$C, $5,$E, $8,$4
ChRedCoin_6_3:
.db $2,$5, $5,$8, $7,$1, $A,$3, $C,$5
ChRedCoin_6_4:
.db $2,$0, $4,$2, $7,$2, $7,$D, $A,$5
ChRedCoin_7_1:
.db $3,$0, $7,$7, $E,$1, $0,$2, $B,$D
ChRedCoin_7_2:
.db $2,$0, $2,$F, $0,$4, $4,$0, $5,$9
ChRedCoin_7_3:
.db $3,$1, $6,$2, $9,$F, $D,$3, $11,$6
ChRedCoin_7_4:
.db $2,$C, $4,$7, $7,$F, $A,$3, $C,$8
ChRedCoin_8_1:
.db $2,$2, $8,$9, $A,$7, $2,$8, $C,$5
ChRedCoin_8_2:
.db $2,$A, $5,$B, $7,$A, $A,$D, $1,$3
ChRedCoin_8_3:
.db $2,$4, $2,$E, $5,$B, $5,$A, $9,$9
ChRedCoin_8_4:
.db $1,$C, $1,$0, $3,$D, $9,$7, $8,$4
ChRedCoin_9_1:
.db $1,$2, $1,$9, $3,$F, $6,$7, $7,$A
ChRedCoin_9_2:
.db $1,$6, $2,$7, $4,$1, $5,$E, $6,$E
ChRedCoin_9_3:
.db $2,$2, $4,$0, $4,$2, $7,$0, $C,$6
ChRedCoin_9_4:
.db $0,$0, $2,$A, $4,$2, $5,$6, $7,$0

ChNullRedCoinData:                  ; 5 red coins all in the first column
.db $0,$0, $0,$0, $0,$0, $0,$0, $0,$0
.ends
