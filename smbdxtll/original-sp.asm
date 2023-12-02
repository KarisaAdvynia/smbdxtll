;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Code related to Original / Super Players modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; When loading Original mode file select, also set Super Players flag

.bank $11 slot 1
.orga $4228
.section "FileSelectInit jump" size 5 overwrite
    jp   FileSelectInitSP
    nop
    nop
FileSelectInitSP_Return:
.ends

.section "FileSelectInitSP" free
FileSelectInitSP:
    ld   a,$01                      ;\
    ld   [W_SPFlag],a               ;/ set Super Players flag
    xor  a                          ;\ replaced
    ld   [$C174],a                  ;/
    jp   FileSelectInitSP_Return
.ends

; When initializing the SP file for the first time, start on A-1

.bank $09 slot 1
.orga $5B0B
.section "SPTitleAfterFileLoad jump" size 3 overwrite
    call SPTitleAfterFileLoad
.ends

.section "SPTitleAfterFileLoad" free
SPTitleAfterFileLoad:
    ld   a,[W_LevelID]
    cp   $24
    jr   nc,@Return                ; if on or after A-1, it's fine
    ld   a,$24                     ;\
    ld   [W_LevelID],a             ;| set level/sublevel ID to A-1
    ld   [W_SublevelID],a          ;/
@Return:
    jp   $5CB9                     ; return with jp, to use subroutine's ret
.ends

; When staring a new Super Players file, and the save file already exists
; Start on A-1, not 1-1

.bank $09 slot 1
.orga $5B81
.section "SPNewFileLevelID jump" size $5B88-$5B81 overwrite
    jp   SPNewFileLevelID
SPNewFileLevelID_Return:
    ld   [W_LevelID],a
    xor  a                          ; replaced
.ends

.section "SPNewFileLevelID" free
SPNewFileLevelID:
    ld   a,$24                      ;\ start on A-1
    ld   [W_SublevelID],a           ;/
    jp   SPNewFileLevelID_Return
.ends

; Fix pause -> "End" to check game mode, not Super Players flag

.bank $04 slot 1
.orga $4DE0
.section "Pause End game mode check" size $4DEC-$4DE0 overwrite
    ld   a,[W_GameMode]    
    and  a                          ; check if game mode is 00: Original
    jr   z,@Original
    ld   a,$38                      ; 38: Super Players menu
    jr   PauseEnd_SetGameState   
@Original:
    ld   a,$18                      ; 18: Main menu
.ends
.orga $4DF0
PauseEnd_SetGameState:

; Fix save file loading to include other saved values

.bank $07 slot 1
.orga $550C
.section "File load fix" size $557E-$550C overwrite
; HL starts with pointer to SaveFile struct ($A100+$40*file)
    ldi  a,[hl]                     ; $A100
    ld   [W_LevelID],a   
    ld   [W_SublevelID],a
    ldi  a,[hl]                     ; $A101
    ld   [$C166],a
    ldi  a,[hl]                     ; $A102
    ld   [$C17A],a
    ldi  a,[hl]                     ; $A103
    ld   [$C17B],a
    ldi  a,[hl]                     ; $A104
    ld   [$C17C],a
    ldi  a,[hl]                     ; $A105
    ld   [$C1F2],a
    ldi  a,[hl]                     ; $A106
    ld   [$C17F],a
    ldi  a,[hl]                     ; $A107
    ld   [$C169],a
    ldi  a,[hl]                     ; $A108
    ld   [$C16A],a
    ldi  a,[hl]                     ; $A109
    ld   [$C1EF],a
    ldi  a,[hl]                     ; $A10A
    ld   [$C182],a
    ldi  a,[hl]                     ; $A10B
    ld   [$C183],a
    ldi  a,[hl]                     ; $A10C
    ld   [$C184],a
    ldi  a,[hl]                     ; $A10D
    ld   [$C185],a
    ldi  a,[hl]                     ; $A10E
    ld   [$C186],a
    ldi  a,[hl]                     ; $A10F
    ld   [$C1C5],a
    ldi  a,[hl]                     ; $A110
    ld   [$C1CE],a
    ldi  a,[hl]                     ; $A111
    ld   [$C1A9],a
    ldi  a,[hl]                     ; $A112
    ld   [$C1AA],a
    ldi  a,[hl]                     ; $A113
    ld   [$C1AB],a
    ldi  a,[hl]                     ; $A114
    ld   [$C1AC],a
    ldi  a,[hl]                     ; $A115
    ld   [$C16D],a
    ldi  a,[hl]                     ; $A116
    ld   [$C16E],a
    ldi  a,[hl]                     ; $A117
    ld   [$C16F],a
    jr   FileLoadFix_Return
.ends
.orga $557E
FileLoadFix_Return:

