;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Create custom "glitched" palettes resembling FDS world 9
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $04 slot 1

; Layer palette E was only used in vanilla for 8-4's underwater room

.orga $4000 + $0E*$40
.section "Layer palette E" size $40 overwrite
.dw $7E6F,$7FFF,$7E6F,$0000
.dw $7E6F,$0F5F,$0133,$0000
.dw $7E6F,$3018,$7D47,$515F
.dw $7E6F,$4BF4,$0204,$0000
.dw $7E6F,$7FFF,$3A52,$0000
.dw $7E6F,$7B5F,$001F,$0000
.dw $0000,$7FFF,$7D86,$0000
.dw $7E6F,$7FFF,$02BC,$0180
.ends

; set 5-1 warp to W6 to palette 5 (gray pipes)
.orga $4442+$43
.section "5-1 warp to W6 palette index" size 1 overwrite
.db $05*4
.ends
; set 8-1 warp to W5 to palette 5 (gray pipes)
.orga $4442+$4D
.section "8-1 warp to W5 palette index" size 1 overwrite
.db $05*4
.ends
; set 9-1 to new palette E
.orga $4442+$55
.section "9-1 palette index" size 1 overwrite
.db $0E*4
.ends
; set 9-2 to new palette E
.orga $4442+$21
.section "9-2 palette index" size 1 overwrite
.db $0E*4
.ends
; set B-4 warp to WD to palette D (orange pipes)
.orga $4442+$5A
.section "B-4 warp to WD palette index" size 1 overwrite
.db $0D*4
.ends

; Create custom palette for 9-3

.orga $44B2
.section "PaletteOverride jump" size 3 overwrite
    jp   PaletteOverride
PaletteOverride_Return
.ends

.section "PaletteOverride" free
Pal_9_3:
.dw $7E6F,$7FFF,$00D9,$50A6
.dw $7E6F,$0F5F,$0133,$31AC
.dw $7E6F,$7FFF,$5AF6,$31AC
.dw $7E6F,$7FFF,$5AF6,$31AC
.dw $7E6F,$7FFF,$00FD,$3E0F
.dw $7E6F,$7B5F,$001F,$0000
.dw $0000,$7FFF,$7D86,$0000
.dw $7E6F,$7FFF,$02BC,$0180

PaletteOverride:
    ld   a,[W_SublevelID]
    cp   $22
    jr   z,@Override_9_3
    ld   a,[W_SublevelID]
    jp   PaletteOverride_Return     ; needs to end with sublevel ID in A

@Override_9_3:
    ld   de,Pal_9_3-$4000           ; DE should be palette offset
    jp   $44CD                      ; copy palette to buffer
.ends
