# Super Mario Bros. Deluxe: The Lost Levels

## How to run

Patch to Super Mario Bros. Deluxe (U V1.1). A .bps patch has been included in the release, for convenience.

If you're unsure whether you have V1.1, see the [disassembly](https://github.com/KarisaAdvynia/smbdx-disasm) for hashes, or ensure in a hex-editor that the byte at $014C is 01 (not 00).

To assemble from source, place these files in the same directory as `smbdxtll.asm`:
- the vanilla ROM, named `smbdx.gbc`
- `wla-gb.exe` and `wla-link.exe`, from [WLA DX](https://github.com/vhelin/wla-dx)

Then run:
```
wla-gb smbdxtll.asm
wlalink smbdxtll-linkfile smbdxtll.gbc
```
## About SMBDXTLL

This hack is an extension of "Super Mario Bros. for Super Players", a mode based on SMB2 (Japan) in vanilla SMB Deluxe. 1-1 to 8-4 were mostly complete in vanilla, but 9-1 to D-4 existed in the game's data in increasingly unfinished states. Lost Levels isn't just a localized name anymore, since those are literally *lost levels*!

The primary goal is functional Challenge mode versions of each SMB2J level, with red coins, a Yoshi egg, and a high score target. Item placement tries to mimic the vanilla game, but with elements of SMB2J's more precise gameplay, e.g. some red coins require Koopa bounces.

### As of 0.2, features include:
- All Challenge mode levels are unlocked from the start
- Expanded Challenge level select screen
    - Press Select to toggle between 1-1 to 8-4 and 9-1 to D-4
    - The score bar takes 2,000,000 points to fill instead of 1,160,000
    - The background color changes roughly every 500,000 points (green, orange, red, blue, *yellow*)
- 1-1 to 8-4 are fully implemented in Challenge mode, with all 3 medals obtainable
- 9-1 to 9-4 are partially implemented-- the levels were fixed up enough to be clearable, the 3 medals are obtainable, and 9-1 to 9-3 were given custom palettes, but the gameplay isn't fully functional
- A-1 to D-4 are enterable, but they remain in their (mostly unplayable) state that existed unused in the ROM, and don't have red coins/Yoshi eggs/score targets yet<br>&nbsp;
- Level timers have been fixed to match FDS SMB2J, instead of matching SMB1
- Loopback pipes don't lead as far back, or don't lead backward at all (precedent: vanilla SMB Deluxe changed SMB1 8-4's loopback pipes)
- Warp zone pipes have been redirected to lead near the flagpole, in Challenge mode
- Worlds 9 to D have been given overworlds (to not softlock when entered), recycling 5 overworlds from earlier in the game<br>&nbsp;
- Due to the large number of hidden items in SMB2J (which may be necessary for challenge medals), all vanilla invisible blocks and item bricks have been marked in-game. (Yoshi egg blocks are still unmarked!)

## Future plans

Continuing this hack would rely on a proper editor. Assembly-based hacks can only get so far.
- Include fully functional versions of 9-1 to D-4
- Edit Original/Super Players mode to include 1-1 to 9-4 ("Original 1986") and A-1 to D-4 ("Super Mario Bros. For Ultra Players"), respectively, and unlock their respective levels in Challenge mode
    - World 9 would only be accessed in Original 1986 mode if all of 1-1 to 8-4 were cleared on that file
    - Ultra Players mode would be unlocked after clearing the game once
    - There'd be an in-game button code to unlock all Challenge levels from the start, for players who prefer current behavior
- Customize the warp zone rooms in Challenge mode, like vanilla SMB Deluxe did in 1-2 and 4-2
- Edit "Yoshi is Here" to showcase new egg locations, and bias the randomness to favor levels that don't have the Yoshi Egg Medal yet
- Add a unique abstract overworld for world 9
- Ensure all 5 awards are obtainable by some means

## Other

Feel free to use any part of this in your own hacks-- that's why I've released the source. Credit would be appreciated if you use the code. The levels are just minor edits of Nintendo's, so I don't expect credit for those.

If you have any feedback on the score targets, item placement, etc, feel free to message me (Karisa109 on Discord is the fastest way, at the time of writing).

\- Karisa