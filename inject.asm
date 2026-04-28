.n64
.open ROM_IN, ROM_OUT, 0x00000000

/******************** Includes *****************************/
.include "asm/sections.asm"
.include "asm/symbols.asm"
// for now, i expect the guy trying to use this have a mangler rom and/or extended rom. FOR NOW

// definelabels used for opting in or out of something
; .definelabel OPTION_PING, 1
.definelabel OPTION_GIGALEAK_LEVELS, 1
.definelabel OPTION_DEBUG, 1
.definelabel OPTION_JP_FONT, 1

// includes for options
.include "src/ping.asm"
.include "src/gigaleak_levels.asm"
.include "src/custom_injects.asm"
.include "src/jp_font.asm"

.headersize SEC_MAIN_HEADERSIZE

.ifdef OPTION_DEBUG
.org gDebuglevelSelect :: .byte 0x01
.endif

// mario's eyes moving left and right
/* act_idle */
.org 0x80260cb4
.area 0x80260f94 - 0x80260cb4, 0
.importobj "obj/act_idle/act_idle_hook.o"
.endarea

.close
