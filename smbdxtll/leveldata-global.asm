;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level data - Edits to main/sprite data and timers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Fix level timers to correspond with FDS version
; (vanilla Deluxe's SP timers are just a copy of the SMB1 timers)

.bank $04 slot 1

.orga $497F
.section "Level timers" size $68 overwrite
                         ;          |    +100:    | -100:
.dw 400, 400, 400, 300   ; World 1  | 1-3         |
.dw 400, 400, 400, 300   ; World 2  | 2-3         |
.dw 400, 400, 400, 400   ; World 3  | 3-2 3-3 3-4 |
.dw 400, 400, 400, 300   ; World 4  | 4-3         | 4-4
.dw 400, 400, 400, 300   ; World 5  | 5-1 5-3     |
.dw 400, 400, 400, 400   ; World 6  | 6-3 6-4     |
.dw 400, 400, 400, 400   ; World 7  | 7-3         |
.dw 400, 400, 400, 400   ; World 8  | 8-1 8-3     |
.dw 400, 400, 400, 400   ; World 9  |             |
.dw 400, 400, 400, 300   ; World A  |             | A-4
.dw 400, 400, 300, 300   ; World B  |             | B-3
.dw 400, 400, 400, 300   ; World C  |             |
.dw 400, 400, 400, 400   ; World D  |             |
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Edit object/screen exit data

.bank $0D slot 1

; New sublevel main data pointers

.orga $7BB7 + 3*$08
.section "sublevel 08 main pointer" overwrite
.dl Sublevel08Main
.ends
.orga $7BB7 + 3*$11
.section "sublevel 11 main pointer" overwrite
.dl Sublevel11Main
.ends
.orga $7BB7 + 3*$35
.section "sublevel 35 main pointer" overwrite
.dl Sublevel35_44Main
.ends
.orga $7BB7 + 3*$43
.section "sublevel 43-44 main pointer" overwrite
.dl Sublevel43Main
.dl Sublevel35_44Main
.ends
.orga $7BB7 + 3*$4D
.section "sublevel 4D main pointer" overwrite
.dl Sublevel4DMain
.ends

; Sublevel 27 (1-2 pipe loopback): redirect loopback screen exit to goal (63 x03 yD)
.orga $70F3 + 3
.section "sublevel 37 screen exit" overwrite
.db $63,$00,$D3,$21
.ends

; Sublevel 35 (1-2 warp to W3) / Sublevel 44 (5-2 warp to W8):
; repoint, to add screen exit to shared goal (63 x03 yD) (shared between 1-2/3-2/4-2/6-2/A-2/B-2)

; These have different challenge/warp zone data, but the same object/screen exit data,
; so they can share pointers

.unbackground $3702F $37087  ; free old sublevel 35
.unbackground $373A2 $373FA  ; free old sublevel 44

.section "Sublevel35_44Main" superfree
Sublevel35_44Main:
.db $04,$4E,$D3
.db $63,$00,$D3,$41   ; new screen exit on screen 4
.db $FF
.db $23,$F3,$03, $01,$F3,$3B, $03,$E5,$27, $03,$AB,$27,\
    $86,$F4,$03, $86,$BB,$01, $02,$F0,$33, $01,$F2,$34, $FF
.db $03,$E1,$27, $02,$65,$27, $06,$A9,$27, $86,$F0,$03,\
    $86,$74,$02, $86,$B8,$06, $FF,
.db $0A,$E7,$18, $09,$D8,$18, $08,$C9,$18, $07,$BA,$18,\
    $06,$AB,$18, $05,$9C,$18, $04,$8D,$18, $03,$7E,$18,\
    $02,$6F,$18, $FF,
.db $0C,$50,$18, $4B,$4E,$18, $4B,$4F,$18, $87,$C6,$02, $FF
.ends

; Sublevel 08 (3-1 main): repoint, to redirect warp to W1 to cloud bonus fall

.unbackground $34B37 $34D6F  ; free old sublevel 08

.section "Sublevel08Main" superfree
Sublevel08Main:
.db $10,$4E,$D0
.db $3B,$00,$41,$40   ;\
.db $3C,$00,$F4,$52   ;| vanilla screen exits
.db $3D,$00,$41,$80   ;/
.db $08,$09,$41,$F0   ; new screen exit on screen F
.db $FF
.db $81,$50,$02,$89,$DB,$00,$88,$CD,$00,$04,$EE,$42,$03,$41,$19,$01,$51,$1A,$01,$52,$1F,$01,$53,$1B,$01,$60,$19,$03,$61,$1C,$01,$64,$19,$05,$70,$1F,$05,$80,$1F,$01,$72,$1D,$01,$82,$1E,$05,$90,$1C,$02,$95,$19,$07,$A0,$1F,$07,$B0,$1F,$07,$C0,$1F,$07,$D0,$1F,$07,$E0,$1F,$01,$A1,$1D,$01,$B1,$1E,$01,$A3,$1D,$01,$B3,$1E,$01,$D0,$1D,$01,$E0,$1E,$01,$D2,$1D,$01,$E2,$1E,$01,$D4,$1D,$01,$E4,$1E,$FF,$81,$52,$01,$88,$C5,$00,$89,$D7,$00,$89,$D8,$00,$81,$4B,$01,$81,$5E,$02,$0B,$75,$04,$06,$B5,$04,$01,$BB,$25,$04,$BC,$04,$FF,$04,$E6,$42,$89,$D8,$00,$88,$CB,$00,$81,$4D,$01,$04,$F0,$03,$03,$B5,$01,$01,$B8,$76,$01,$7C,$26,$01,$BC,$04,$06,$7D,$01,$FF,$81,$50,$02,$89,$DB,$00,$88,$CD,$00,$04,$EE,$42,$08,$F0,$03,$03,$7C,$04,$01,$7F,$3E,$FF,$81,$52,$01,$88,$C5,$00,$89,$D7,$00,$89,$D8,$00,$81,$4B,$01,$81,$5E,$02,$03,$70,$04,$87,$B2,$03,$01,$73,$3E,$04,$74,$04,$03,$65,$27,$07,$F9,$03,$01,$BA,$04,$04,$7C,$04,$FF,$04,$E6,$42,$89,$D8,$00,$88,$CB,$00,$81,$5D,$01,$03,$70,$04,$03,$F0,$03,$01,$73,$55,$80,$D3,$01,$04,$74,$04,$01,$B7,$74,$48,$78,$18,$80,$BA,$03,$FF,$81,$70,$02,$89,$DA,$00,$88,$CE,$00,$04,$EF,$42,$03,$F5,$03,$8A,$DC,$01,$FF,$81,$52,$01,$88,$C5,$00,$89,$D6,$00,$89,$D7,$00,$81,$7B,$02,$01,$B0,$26,$02,$B1,$01,$8A,$C9,$01,$01,$E9,$46,$FF,$01,$60,$3F,$81,$5D,$01,$80,$A1,$04,$03,$F3,$03,$87,$C6,$02,$02,$F8,$03,$80,$BA,$03,$80,$BE,$03,$FF,$81,$70,$02,$02,$EE,$42,$04,$FA,$03,$FF,$81,$52,$01,$88,$C5,$00,$89,$D7,$00,$89,$D8,$00,$81,$6B,$01,$81,$5E,$02,$04,$F1,$03,$01,$D0,$95,$01,$E0,$8D,$41,$E9,$18,$42,$DA,$18,$43,$CB,$18,$44,$BC,$18,$45,$AD,$18,$46,$9E,$18,$47,$8F,$18,$FF,$88,$CB,$00,$81,$7D,$01,$47,$80,$18,$03,$F5,$03,$01,$48,$21,$49,$58,$20,$01,$E8,$18,$03,$AD,$19,$01,$BD,$1A,$01,$CC,$19,$03,$CD,$1C,$05,$DC,$1F,$05,$EC,$1F,$01,$BE,$1F,$01,$BF,$1B,$01,$DE,$1D,$01,$EE,$1E,$FF,$81,$80,$02,$89,$DB,$00,$88,$CD,$00,$04,$EE,$42,$01,$C0,$19,$FF,$81,$82,$01,$88,$C5,$00,$89,$D7,$00,$89,$D8,$00,$81,$7B,$01,$81,$8E,$02,$FF,$04,$E6,$42,$89,$D8,$00,$88,$CB,$00,$81,$4D,$01,$80,$D3,$01,$41,$E7,$18,$42,$D8,$18,$43,$C9,$18,$44,$BA,$18,$45,$AB,$18,$46,$9C,$18,$47,$8D,$18,$48,$7E,$18,$49,$6F,$18,$FF,$81,$50,$02,$89,$DB,$00,$88,$CD,$00,$04,$EE,$42,$49,$60,$18,$0B,$61,$18,$01,$F1,$03,$87,$C6,$02,$4B,$4E,$18,$4B,$4F,$18,$FF
.ends

; Sublevel 3F (4-1 cloud bonus): redirect loopback screen exit to goal
.orga $72A9 + 4
.section "sublevel 3F screen exit dest screen" overwrite
.db $0B
.ends

; Sublevel 43 (5-1 warp to W6): repoint, to add screen exit to goal

.unbackground $37372 $373A1  ; free old sublevel 43

.section "Sublevel43Main" superfree
Sublevel43Main:
.db $02,$4E,$D0
.db $10,$13,$44,$10   ; new screen exit on screen 1, to sublevel 10 x134 y4
.db $FF
.db $80,$D3,$01,$0A,$E7,$18,$09,$D8,$18,$08,$C9,$18,$07,$BA,$18,$06,$AB,$18,$05,$9C,$18,$04,$8D,$18,$03,$7E,$18,$02,$6F,$18,$FF,$0C,$50,$18,$4B,$4E,$18,$4B,$4F,$18,$87,$C6,$02,$FF
.ends

; Sublevel 11 (5-2 main): repoint, to redirect warp to W7 to goal (63 x03 yD)

.unbackground $359C9 $35B61  ; free old sublevel 11

.section "Sublevel11Main" superfree
Sublevel11Main:
.db $0D,$4E,$61
.db $44,$00,$F3,$82   ;\ vanilla screen exits
.db $63,$00,$D3,$A1   ;/
.db $63,$00,$D3,$C1   ; new screen exit on screen C
.db $FF
.db $4B,$40,$04,$0A,$46,$04,$01,$B2,$74,$43,$58,$07,$01,$88,$99,$43,$59,$08,$01,$89,$9A,$02,$F8,$03,$47,$5E,$07,$01,$CE,$99,$47,$5F,$08,$01,$CF,$9A,$FF,$10,$40,$04,$02,$F1,$03,$04,$73,$01,$0D,$B3,$04,$0D,$C3,$04,$0D,$D3,$04,$0D,$E3,$04,$01,$77,$76,$01,$78,$01,$FF,$10,$40,$04,$07,$82,$04,$07,$92,$04,$07,$A2,$04,$07,$B2,$04,$01,$84,$40,$43,$94,$04,$80,$D9,$01,$05,$9B,$04,$05,$AB,$04,$05,$BB,$04,$FF,$10,$40,$04,$01,$B0,$40,$03,$B1,$04,$43,$B3,$04,$01,$B3,$24,$43,$B4,$04,$43,$B5,$04,$01,$F5,$03,$0A,$B6,$04,$0A,$C6,$04,$0A,$D6,$04,$01,$F8,$03,$07,$A9,$27,$FF,$10,$40,$04,$10,$50,$04,$10,$60,$04,$10,$70,$04,$04,$B0,$04,$01,$B4,$96,$07,$B5,$04,$01,$BC,$25,$80,$DE,$01,$FF,$10,$40,$04,$0A,$50,$04,$0A,$60,$04,$0A,$70,$04,$08,$B1,$04,$01,$B9,$96,$05,$4A,$04,$80,$AC,$04,$01,$4F,$41,$FF,$10,$40,$04,$10,$50,$04,$10,$60,$04,$10,$70,$04,$01,$F0,$03,$05,$E6,$18,$04,$D7,$18,$03,$C8,$18,$01,$FB,$03,$80,$BC,$03,$80,$BE,$03,$FF,$0A,$40,$04,$47,$58,$07,$01,$C8,$99,$47,$59,$08,$01,$C9,$9A,$03,$FB,$03,$02,$4E,$04,$01,$BF,$24,$FF,$07,$40,$04,$07,$80,$04,$07,$90,$04,$06,$A0,$04,$05,$B0,$04,$01,$87,$55,$09,$F7,$03,$4F,$1A,$59,$4F,$1E,$59,$FF,$05,$F0,$03,$4F,$12,$59,$0B,$45,$04,$08,$D5,$27,$03,$FD,$03,$FF,$0B,$40,$04,$0B,$F0,$03,$80,$B0,$04,$45,$C6,$04,$44,$57,$07,$01,$97,$99,$44,$58,$08,$01,$98,$9A,$45,$C8,$04,$45,$CA,$04,$43,$CB,$04,$84,$AB,$01,$85,$4D,$06,$48,$4E,$08,$43,$CC,$04,$43,$CD,$04,$43,$CE,$04,$4B,$4F,$04,$FF,$10,$40,$04,$10,$50,$04,$10,$60,$04,$10,$70,$04,$10,$80,$04,$10,$90,$04,$10,$A0,$04,$10,$B0,$04,$10,$C0,$04,$10,$D0,$04,$10,$E0,$04,$FF,$0C,$40,$04,$87,$C6,$02,$4B,$4F,$04,$FF
.ends

; Sublevel 4D (8-1 warp to W5): repoint, to add screen exit to goal

.unbackground $377CB $377FA   ; free old sublevel 4D

.section "Sublevel4DMain" superfree
Sublevel4DMain:
.db $02,$4E,$D0
.db $1C,$0C,$44,$10   ; new screen exit on screen 1, to sublevel 1C xC4 y4
.db $FF
.db $80,$D3,$01,$0A,$E7,$18,$09,$D8,$18,$08,$C9,$18,$07,$BA,$18,$06,$AB,$18,$05,$9C,$18,$04,$8D,$18,$03,$7E,$18,$02,$6F,$18,$FF,$0C,$50,$18,$4B,$4E,$18,$4B,$4F,$18,$87,$C6,$02,$FF
.ends

; Sublevel 53 (8-4 room 4): redirect loopback pipe to restart the room
.orga $7989 + 3
.section "sublevel 53 first screen exit" overwrite
.db $53,$01,$D5,$31
.ends

; Sublevel 54 (8-4 room 5): redirect loopback pipe to restart the room
.orga $7A60 + 3
.section "sublevel 54 screen exit" overwrite
.db $54,$00,$D3,$31
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $12 slot 1

; Redirect sublevel 50 (8-3 cloud bonus) sprite data to sublevel 42 (5-1 cloud bonus, which correctly has a narrower platform)

.unbackground $4A99E $4A9B1  ; free old sublevel 50 sprite data

.orga $6B14 + 2*$50
.section "sublevel 50 sprite pointer" overwrite
.dw $67EC  ; sublevel 42 sprite pointer
.ends

; Redirect sublevel 43 (5-1 warp zone to W6) and 5A (B-4 warp zone to WD) sprite data to sublevel 4D (8-1 warp zone to W5).
; 5-1 was missing a Piranha Plant, B-4 was missing everything

.unbackground $4A7FF $4A80B  ; free old sublevel 43 sprite data

.orga $6B14 + 2*$43
.section "sublevel 43 sprite pointer" overwrite
.dw $696B  ; sublevel 4D sprite pointer
.ends
.orga $6B14 + 2*$5A
.section "sublevel 5A sprite pointer" overwrite
.dw $696B  ; sublevel 4D sprite pointer
.ends


; Edit W9+ sprite data

.unbackground $49FC1 $49FF8  ; free old sublevel 22-23 sprite data
.unbackground $4A0EA $4A1A5  ; free old sublevel 25-26 sprite data

.orga $6B14 + 2*$22
.section "sublevel 22-26 sprite pointers" overwrite
.dw Sublevel22Spr
.dw Sublevel23Spr
.dw $5FF9   ; vanilla, for now?
.dw Sublevel25Spr
.dw Sublevel26Spr
.ends

; sublevel 22 (9-3 main) sprites: add flagpole

.section "Sublevel22Spr" free
Sublevel22Spr:
.db $00,$0A,$00,$C7,$00,$1A  ; Bowser (vanilla)
.db $00,$05,$00,$E6,$00,$09  ; Flagpole
.db $FF
.ends

; sublevel 23 (9-4) sprites: add flagpole

.section "Sublevel23Spr" free
Sublevel23Spr:
.db $00,$0E,$00,$13,$00,$04  ;\
.db $00,$0E,$00,$17,$00,$03  ;|
.db $00,$0E,$00,$1B,$00,$31  ;|
.db $00,$0E,$00,$22,$00,$29  ;| vanilla
.db $00,$0D,$00,$27,$00,$17  ;|
.db $00,$0A,$00,$35,$00,$2C  ;|
.db $00,$0A,$00,$42,$00,$26  ;|
.db $00,$0D,$00,$49,$00,$1F  ;/
.db $00,$05,$00,$71,$00,$09  ; Flagpole
.db $FF
.ends

; sublevel 25 (A-2 main) sprites: add warp zone activator

.section "Sublevel25Spr" free
Sublevel25Spr:
.db $00,$0D,$00,$10,$00,$2D  ;\
.db $00,$0C,$00,$1B,$00,$5E  ;|
.db $00,$0C,$00,$21,$00,$5E  ;|
.db $00,$0A,$00,$26,$00,$5E  ;| vanilla
.db $00,$09,$00,$2B,$00,$5E  ;|
.db $00,$0A,$00,$35,$00,$5E  ;|
.db $00,$0E,$00,$44,$00,$5D  ;|
.db $00,$06,$00,$71,$00,$5E  ;|
.db $00,$08,$00,$85,$00,$53  ;|
.db $00,$0F,$00,$55,$00,$19  ;|
.db $00,$0F,$00,$58,$00,$19  ;|
.db $00,$0F,$00,$5B,$00,$19  ;|
.db $00,$0F,$00,$5E,$00,$19  ;|
.db $00,$08,$00,$7A,$00,$47  ;|
.db $00,$0F,$00,$7C,$00,$19  ;|
.db $00,$0F,$00,$82,$00,$19  ;|
.db $00,$0D,$00,$96,$00,$17  ;|
.db $00,$0E,$00,$9C,$00,$24  ;|
.db $00,$0C,$00,$9E,$00,$24  ;|
.db $00,$0C,$00,$A8,$00,$19  ;|
.db $00,$0C,$00,$C6,$00,$19  ;/
.db $00,$03,$00,$C8,$00,$34  ; warp zone activator
.db $FF
.ends

; sublevel 26 (A-3) sprites: add warp zone activator

.section "Sublevel26Spr" free
Sublevel26Spr:
.db $00,$09,$00,$46,$00,$2C  ;\
.db $00,$09,$00,$68,$00,$2B  ;|
.db $00,$08,$00,$85,$00,$26  ;|
.db $00,$08,$00,$9E,$00,$26  ;| vanilla
.db $00,$0A,$00,$16,$00,$22  ;|
.db $00,$0A,$00,$93,$00,$22  ;|
.db $00,$0D,$00,$9C,$00,$2D  ;|
.db $00,$05,$00,$A1,$00,$09  ;| (flagpole)
.db $00,$0D,$00,$E3,$00,$19  ;|
.db $00,$0C,$00,$F6,$00,$19  ;/
.db $00,$03,$00,$F8,$00,$34  ; warp zone activator
.db $FF
.ends
