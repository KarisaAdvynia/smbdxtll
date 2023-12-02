;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Super Mario Bros. Deluxe: The Lost Levels
; Patch to SMB Deluxe U V1.1
; For assembling with WLA DX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.define internalname "SMB DELUXE TLL"
.define version      "    v0.2"  ; needs to be 8 characters, space-pad from left if needed

.memorymap
    slotsize $4000
    defaultslot 1
    slot 0 $0000
    slot 1 $4000
.endme
.rombanksize $4000
.rombanks $40

.computegbchecksum
.computegbcomplementcheck

.background "smbdx.gbc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Vanilla defines
; ROM bank 0
.define SetROMBank            $10DE ; subroutine: Change ROM bank to register A
.define CopyBytesLong         $1432 ; subroutine: Copy BC bytes from [$C415]:[HL] to [DE], then return to bank A
.define BitTable8Asc          $2DD4
; HRAM
.define H_ButtonsPressed      $FF8C
.define H_PlayerXHigh         $FFA8
.define H_GameState           $FFB5
; SRAM
.define S_ChalLvHiScores      $A2AD
; WRAM
.define W_SPFlag              $C160 ; Super Players flag
.define W_SublevelID          $C162
.define W_LevelID             $C163
.define W_HardFlag            $C166
.define W_ChalUnlockFlagsP0   $C18E ; Challenge level unlock flags, page 0 (vanilla)
.define W_GameMode            $C1A8
.define W_ChallengeFlag       $C283
.define W_ChalScoreBarPixels  $C35D

; Free WRAM defines (~$C590-CAFF seem free)
.enum $C600
W_ChalUnlockFlagsP1    dsb 4 ; Challenge level unlock flags, W9+ [might remap $C18E later]
W_ChalPage             db    ; Challenge menu page number
.ende

; Free SRAM defines ($B6CA+ are unused)
.define NewLevelSRAMOffset    $40
.define NewLevelCount         $34
.enum $C000-NewLevelSRAMOffset*3
S_NewChalBlockStart    .db
S_RedCoinsBest         dsb NewLevelSRAMOffset
S_YoshiEggMedals       dsb NewLevelSRAMOffset
S_HighScoreMedals      dsb NewLevelSRAMOffset
S_NewChalBlockEnd      .db
.ende

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Code bank freespace
;.unbackground  $3EDF  $3FFF  ; bank 00 freespace  This interferes with `superfree` directives
.unbackground  $F9D0  $FFFF  ; bank 03 freespace
.unbackground $12A9C $13FFF  ; bank 04 freespace
.unbackground $1A58E $1BFFF  ; bank 06 freespace
.unbackground $1DF5B $1FFFF  ; bank 07 freespace
.unbackground $22597 $23FFF  ; bank 08 freespace
.unbackground $25D97 $27FFF  ; bank 09 freespace
.unbackground $2B4EA $2BFFF  ; bank 0A freespace
.unbackground $2F5BB $2FFFF  ; bank 0B freespace
.unbackground $4703C $47FFF  ; bank 11 freespace
.unbackground $4EAA9 $4FFFF  ; bank 13 freespace
.unbackground $534FA $53FFF  ; bank 14 freespace
.unbackground $57B90 $5FFFF  ; bank 15 freespace
.unbackground $77FDA $77FFF  ; bank 1D freespace
.unbackground $7E9A0 $7FFFF  ; bank 1F freespace

; Level data bank overwrites
.unbackground $3283D $33FFF   ; bank 0C freespace
.unbackground $37CE3 $37FFF   ; bank 0D freespace
.unbackground $42DE0 $43FFF   ; bank 10 freespace
.unbackground $484F0 $48D15   ; vanilla challenge objects/red coin coordinates
.unbackground $4ABDC $4BFFF   ; bank 12 freespace
.unbackground $CA2A0 $CBFFF   ; bank 32 freespace

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $00 slot 0
.orga $0134
.section "internal name" size $0F overwrite
.db internalname
.ends

; Misc code
.include "smbdxtll/misc.asm"

; Challenge mode code
.include "smbdxtll/saveremap.asm"
.include "smbdxtll/chalmenupage.asm"
.include "smbdxtll/chalmenuscore.asm"
.include "smbdxtll/chalresults.asm"
.include "smbdxtll/levelfixes.asm"
.include "smbdxtll/cloudbonus.asm"

; Overworld code
.include "smbdxtll/overworld.asm"

; Original/Super Players mode code (unfinished)
.include "smbdxtll/original-sp.asm"
.include "smbdxtll/warpzone.asm"

; Graphics edits
.include "smbdxtll/graphics.asm"
.include "smbdxtll/palette.asm"

; Level edits
.include "smbdxtll/leveldata-global.asm"
.include "smbdxtll/leveldata-challenge.asm"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
