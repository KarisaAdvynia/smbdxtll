;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Cloud bonus code
; set hardcoded music + account for 10,000 point bonuses
; 73 coins in sublevel 39 (2-1), 3C (3-1), 3F (4-1)
; 75 coins in sublevel 42 (5-1), 50 (8-3)
; 16 coins in sublevel 56 (9-3)
; 55 coins in sublevel 57 (A-1), 59 (B-1), 5E (D-2)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $03 slot 1

; Prevent 10,000 point bonus check from being skipped in Super Players mode

.orga $708B
.section "CloudBonus_SkipAntiSP" overwrite
    jr +
    nop
    nop
    nop
+
.ends

; Change the levels that give 10,000 point bonuses, and set their coin ocunts

.orga $709F
.section "Number of cloud bonuses" overwrite
    cp $09                          ; Super Players has 9 cloud bonus sublevels
.ends

.orga $7093
.section "ld Vine10000PointSublevels" overwrite
    ld   hl,Vine10000PointSublevels
.ends
.orga $70A5
.section "ld Vine10000PointCoinCounts" overwrite
    ld   hl,Vine10000PointCoinCounts
.ends

.section "Cloud bonus expanded tables" free
Vine10000PointSublevels:
.db $39,$3C,$3F,$42,$50,$56,$57,$59,$5E
Vine10000PointCoinCounts:
.db  73, 73, 73, 75, 75, 16, 55, 55, 55
.ends

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $04 slot 1

.orga $49F5
.section "Hardcoded cloud bonus music" size $4A27-$49F5 overwrite
    ld   hl,CloudBonusMusicSublevels
    ld   a,[W_SublevelID]
    ld   e,$09
@Loop:
    cp   [hl]
    jr   z,SetCloudBonusMusic
    inc  hl
    dec  e
    jr   nz,@Loop
    jr   SetMusicByLevelType
CloudBonusMusicSublevels:
.db $39,$3C,$3F,$42,$50,$56,$57,$59,$5E
.ends

.orga $4A27
SetMusicByLevelType:
.orga $4A3A
SetCloudBonusMusic:
