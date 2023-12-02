;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Save data remapping
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.bank $07 slot 1

; Init new challenge save data, if checksum failed (SRAM uninitialized)

.orga $5473
.section "InitNewChalSRAM jump" overwrite
    jp InitNewChalSRAM
.ends

.section "InitNewChalSRAM" free
InitNewChalSRAM:
    ld   hl,S_NewChalBlockStart
    ld   b,S_NewChalBlockEnd-S_NewChalBlockStart
    xor  a
@Loop:
    ldi  [hl],a                     ;\ loop: clear bytes
    dec  b                          ;|
    jr   nz,@Loop                   ;/
    ld   hl,$A2AD                   ;\ replaced (vanilla data to clear)
    ld   b,$C3                      ;/
    jp   $5478
.ends

; Remap loading challenge data from SRAM

.orga $5B23
.section "Load S_RedCoinsBest" overwrite
    ld   hl,S_RedCoinsBest
.ends
.orga $5B31
.section "Load S_YoshiEggMedals" overwrite
    ld   hl,S_YoshiEggMedals
.ends
.orga $5B39
.section "Load S_HighScoreMedals" overwrite
    ld   hl,S_HighScoreMedals
.ends
.orga $5B4B
.section "Load S_ChalLvHiScores" overwrite
    ld   hl,S_ChalLvHiScores
.ends

; Remap saving challenge data to SRAM

.orga $5BCD
.section "Save S_RedCoinsBest" overwrite
    ld   hl,S_RedCoinsBest
.ends
.orga $5BD5
.section "Save S_YoshiEggMedals" overwrite
    ld   hl,S_YoshiEggMedals
.ends
.orga $5BDD
.section "Save S_HighScoreMedals" overwrite
    ld   hl,S_HighScoreMedals
.ends
.orga $5BEF
.section "Save S_ChalLvHiScores" overwrite
    ld   hl,S_ChalLvHiScores
.ends

; Iterate over more levels, when calculating total score/medal counts

.bank $11 slot 1

.orga $540A
.section "calculate total score/medal counts" overwrite
    cp   NewLevelCount
.ends
.orga $553C
.section "Red Coin Medal album check 1" overwrite
    cp   NewLevelCount
.ends
.orga $558F
.section "High Score Medal album check 1" overwrite
    cp   NewLevelCount
.ends
.orga $55E2
.section "Yoshi Egg Medal album check 1" overwrite
    cp   NewLevelCount
.ends


.orga $6CD2
.section "Red Coin Medal album check 2" overwrite
    cp   NewLevelCount
.ends
.orga $6CE1
.section "High Score Medal album check 2" overwrite
    cp   NewLevelCount
.ends
.orga $6CF0
.section "Yoshi Egg Medal album check 2" overwrite
    cp   NewLevelCount
.ends

.orga $568E
.section "Peach Award Red Coin Medal check" overwrite
    cp   NewLevelCount
.ends
.orga $5695
.section "Peach Award High Score Medal check" overwrite
    cp   NewLevelCount
.ends
.orga $569C
.section "Peach Award Yoshi Egg Medal check" overwrite
    cp   NewLevelCount
.ends
