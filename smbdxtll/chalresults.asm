;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Challenge results - Change graphics
; 9-3 uses castle variant, 9-4 uses normal variant
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $11 slot 1

.orga $6888
.section "Challenge results palette" size 5 overwrite
    call ChalResults_AdjustLevelID
.ends
.orga $68A9
.section "Challenge results tilemap" size 5 overwrite
    call ChalResults_AdjustLevelID
.ends
.orga $6987
.section "Challenge results 6987" size 5 overwrite
    call ChalResults_AdjustLevelID
.ends
.orga $69AD
.section "Challenge results 69AD" size 5 overwrite
    call ChalResults_AdjustLevelID
.ends
.orga $6A99
.section "Challenge results 6A99" size 5 overwrite
    call ChalResults_AdjustLevelID
.ends
.orga $6D07
.section "Challenge results 6D07" size 5 overwrite
    call ChalResults_AdjustLevelID
.ends

.section "ChalResults_AdjustLevelID" free
ChalResults_AdjustLevelID:
    ld   a,[W_LevelID]
    cp   $22
    jr   z,@SwapBit
    cp   $23
    jr   nz,@TestFor_x_4
@SwapBit:
    xor  $01
@TestFor_x_4:
    and  $03
    ret                             ; -> cp $03
.ends
