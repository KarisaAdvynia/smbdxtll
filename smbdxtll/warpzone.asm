;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Warp zone expansion for A-2, A-3, B-4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Code to redirect pipe destinations

.bank $03 slot 1

.orga $75AE
.section "Warp zone pipe data" size $75E4-$75AE overwrite
;    2   3   4   1   6   7   8   5
;    B   C   D
WarpZone_Sublevels:
.db $01,$35,$36,$08,$43,$11,$44,$4D
.db $25,$26,$5A
WarpZone_PlayerXHigh:
.db $0D,$03,$05,$0F,$01,$0C,$03,$01
.db $0C,$0F,$01
WarpZone_DestLevels:
.db $04,$08,$0C,$00,$14,$18,$1C,$10
.db $28,$2C,$30
.ends

; remap WarpZone_Sublevels, and increase loop index

.orga $75F4
.section "ld WarpZone_Sublevels" size $7604-$75F4 overwrite
    ld   c,$0B   ; check for more sublevel IDs
    ld   hl,WarpZone_Sublevels
    jr   Code037604
.ends
.orga $7604
Code037604:

; remap other table pointers

.orga $7689
.section "ld WarpZone_PlayerXHigh" size 3 overwrite
    ld   hl,WarpZone_PlayerXHigh
.ends
.orga $7695
.section "ld WarpZone_DestLevels" size 3 overwrite
    ld   hl,WarpZone_DestLevels
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Sprite 34: Warp zone text activator

; Code to update sublevel 16x16 tilemap

.bank $08 slot 1

.orga $6420
.section "Warp zone 16x16 text data" size $646D-$6420 overwrite
Ti16_WorldNum:
.db $00,$68,$00,$00,$00,$69,$00,$00,\
    $00,$6A,$00,$00,$00,$9C,$00,$00,\
    $00,$6C,$00,$00,$00,$6D,$00,$00,\
    $00,$6E,$00,$00,$00,$6B,$00,$00,\
    $00,$00,$00,$00,$00,$00,$00,$00,\  ;\ This table doesn't actually matter
    $00,$00,$00,$00                    ;/ as long as the leftmost is 00
WarpZoneText_Sublevels:
.db $01,$35,$36,$08,$43,$11,$44,$4D
.db $25,$26,$5A
WarpZoneText_Data08645D:
.db $D0,$FF,$C0,$FF,$C0,$FF,$C0,$FF,\
    $C0,$FF,$C0,$FF,$C0,$FF,$C0,$FF,\
    $C0,$FF,$C0,$FF,$C0,$FF
.ends

.orga $648A
.section "ld WarpZoneText_Sublevels" size 3 overwrite
    ld   hl,WarpZoneText_Sublevels
.ends
.orga $6499
.section "WarpZoneText number of sublevels" size 2 overwrite
    cp $0B   ; check for more sublevel IDs
.ends
.orga $64AD
.section "ld WarpZoneText_Data08645D" size 3 overwrite
    ld   hl,WarpZoneText_Data08645D
.ends
.orga $6554
.section "ld Ti16_WorldNum" size 3 overwrite
    ld   hl,Ti16_WorldNum
.ends

; Code to update VRAM 8x8 tilemap

.bank $08 slot 1

.orga $631C
.section "Warp zone VRAM data" size $639E-$631C overwrite
TiUp_WarpTo2:                    
.db $9A,$AF,$01,$00,$D2,$00
TiUp_WarpTo3:                    
.db $9A,$AD,$01,$00,$D3,$00
TiUp_WarpTo4:                    
.db $9A,$AD,$01,$00,$D4,$00
TiUp_WarpTo1:                    
.db $9A,$AD,$01,$00,$D1,$00
TiUp_WarpTo6:                    
.db $9A,$AD,$01,$00,$D6,$00
TiUp_WarpTo7:                    
.db $9A,$AD,$01,$00,$D7,$00
TiUp_WarpTo8:                    
.db $9A,$AD,$01,$00,$D8,$00
TiUp_WarpTo5:                    
.db $9A,$AD,$01,$00,$D5,$00
TiUp_WarpToB:                    
.db $9A,$AD,$01,$00,$DB,$00
TiUp_WarpToC:                    
.db $9A,$AD,$01,$00,$DC,$00
TiUp_WarpToD:                    
.db $9A,$AD,$01,$00,$DD,$00
TiUpWorldNumSPPtrs:              
.dw TiUp_WarpTo2, TiUp_WarpTo3, TiUp_WarpTo4, TiUp_WarpTo1,\
    TiUp_WarpTo6, TiUp_WarpTo7, TiUp_WarpTo8, TiUp_WarpTo5,\
    TiUp_WarpToB, TiUp_WarpToC, TiUp_WarpToD
.ends

.orga $63A2
.section "TiUpWarpTextIndex" size $63AD-$63A2 overwrite
TiUpWarpTextIndex:
.db $01,$00,$00,$00,$00,$00,$00,$00,\
    $00,$00,$00
.ends

.orga $63B8
.section "ld TiUpWarpTextIndex" size 3 overwrite
    ld   hl,TiUpWarpTextIndex
.ends
.orga $63F2
.section "ld TiUpWorldNumSPPtrs" size $63FC-$63F2 overwrite
    ld   a,$06                 ; TiUpWorldNumSPLengths is always 6, so why use a table
    ldh  [<$FF97],a
    ld   hl,TiUpWorldNumSPPtrs
.ends

