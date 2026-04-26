.ifdef OPTION_PING

// 0x05002d80
// 0x05008c00

.headersize 0x05000000-0x8FB8B0

.org 0x05002D80
.area 0x05008C00-0x05002D80
.importobj "obj/ping/model.o"
.endarea

; edits to level script to overwrite geo pointers
.orga 0x002AC4C8 :: .word RCP_HmsEnemyping_base
.orga 0x004FC22F :: .word RCP_HmsEnemyping_base

; edits to bhv script to overwrite anim pointers
.orga 0x0021BE94 :: .word ping_anime
.orga 0x0021BEF8 :: .word ping_anime
.orga 0x0021CC6C :: .word ping_anime
.orga 0x0021F18C :: .word ping_anime

.endif
