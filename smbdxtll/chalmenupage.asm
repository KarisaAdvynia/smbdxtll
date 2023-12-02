;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Challenge menu - second page of levels
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $11 slot 1

; Load page-dependent tilemap

.orga $58F6
.section "LoadChalMenuTilemap jump" overwrite
    jp   LoadChalMenuTilemap
.ends

.section "LoadChalMenuTilemap" free
LoadChalMenuTilemap:
    ld   a,[W_ChalPage]
    and  a
    jr   nz,@Page1
    ld   a,$0E                      ;\ page 0 tilemap at $0E:5800 (vanilla)
    ld   [$C415],a                  ;|
    ld   hl,$5800                   ;/
    jr   @CopyTilemap
@Page1:
    ld   a,:Ti_ChalMenuPage1        ;\ page 1 tilemap in freespace
    ld   [$C415],a                  ;|
    ld   hl,Ti_ChalMenuPage1        ;/
@CopyTilemap:
    ld   de,$DC00                   ;\
    ld   bc,$02D0                   ;| replaced
    ld   a,:@CopyTilemap            ;|
    call CopyBytesLong              ;|
    ld   de,W_ChalUnlockFlagsP0     ;/
    ld   a,[W_ChalPage]
    and  a
    jr   z,@Return
    ld   de,W_ChalUnlockFlagsP1     ; if page 1, use different unlock flags
@Return:
    jp $590C
.ends

.orga $5984
.section "LoadChalMenuMedals jump" overwrite
    jp   LoadChalMenuMedals
.ends

.section "LoadChalMenuMedals" free
LoadChalMenuMedals:
    ld   a,[W_ChalPage]             ;\
    swap a                          ;|
    rla                             ;| b = page*$20
    ld   b,a                        ;/
    ldh  a,[<$FFA6]
    add  a,b
    ld   [W_LevelID],a
    jp   $5989
.ends

; If Select is pressed, swap page

.orga $5876
.section "ChalMenuButtonCheck jump" overwrite
    jp   ChalMenuButtonCheck
    nop
ChalMenuButtonCheck_Return:
.ends

.section "ChalMenuButtonCheck" free
ChalMenuButtonCheck:
    ldh  a,[<H_ButtonsPressed]
    bit  2,a                        ; bit 2: Select
    jr   z,@VanillaCheck
    ld   a,[W_ChalPage]             ;\
    xor  a,$01                      ;| toggle page
    ld   [W_ChalPage],a             ;/
    ld   a,[W_SublevelID]           ;\ store cursor position in buffer
    ld   [$C35C],a                  ;/
    ld   a,$1D                      ;\ 1D: Challenge menu init
    ldh  [<H_GameState],a           ;/
    ld   a,$47                      ;\ play same sound effect as arrows
    ldh  [<$FFF2],a                 ;/
    ret
@VanillaCheck:
    and  $03                        ; replaced
    jp   ChalMenuButtonCheck_Return
.ends

; Change music when swapping page
; If prevented from restarting, the music would lag when loading. Changing music felt like the best way to avoid restarting/lagging

.orga $5848
.section "ChalMenuSetMusic jump" overwrite
    jp   ChalMenuSetMusic
    nop
    nop
ChalMenuSetMusic_Return:
.ends

.section "ChalMenuSetMusic" free
ChalMenuMusicIDs:
.db $75   ; normal challenge menu music
.db $6C   ; Super Players title screen music

ChalMenuSetMusic:
    ld   a,[W_ChalPage]
    ld   e,a
    ld   d,$00
    ld   hl,ChalMenuMusicIDs
    add  hl,de                      ; index with challenge page
    ld   a,[hl]
    ld   [$DE68],a                  ; play music
    jp   ChalMenuSetMusic_Return
.ends

; When A is pressed, enter page-dependent level, if unlocked

.orga $5890
.section "ChalMenuAPress jump" overwrite
    jp   ChalMenuAPress
.ends

.section "ChalMenuAPress" free
ChalMenuAPress:
; determine if level is unlocked
    ld   a,[W_SublevelID]             ;\ vanilla code from 11:5AFC, to index unlock flag
    srl  a                            ;|
    srl  a                            ;|
    ld   e,a                          ;| e = bit index (row number)
    ld   d,$00                        ;|
    ld   hl,BitTable8Asc              ;|
    add  hl,de                        ;|
    ld   c,[hl]                       ;| c = bitmask
    ld   a,[W_SublevelID]             ;|
    and  $03                          ;|
    ld   e,a                          ;/ de = byte index (column number)

    ld   hl,W_ChalUnlockFlagsP0
    ld   a,[W_ChalPage]
    and  a
    jr   z,+
    ld   hl,W_ChalUnlockFlagsP1       ; if page 1, use different flags
+   add  hl,de
    ld   a,[hl]
    and  c
    jp   z,$5897                      ; not unlocked: return to play error buzz
; Enter level
    ld   a,[W_ChalPage]               ;\
    rla                               ;|
    swap a                            ;|
    ld   h,a                          ;/ h = page*$20
    ld   a,[W_SublevelID]
    ld   [$C35C],a                    ; don't include page in cursor position buffer
    add  h
    ld   [W_LevelID],a                ; include page in level ID
    jp   $58A5                        ; continue vanilla code after setting level ID
.ends
