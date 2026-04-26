.ifdef OPTION_GIGALEAK_LEVELS

.include "src/levels/castle.asm"
.include "src/levels/donjon.asm"
.include "src/levels/athletic.asm"

.headersize SEC_GODDARD_HEADERSIZE
/* sLevelSelectStageNames */
.org 0x801a7830
.area 0x801a7c30 - 0x801a7830, 0
.importobj "obj/hooks/sLevelSelectStageNames.o"
.endarea

; overwrite script_exec_level_table pointer with the custom one
.orga 0x002ABE7C :: .word cahstom_script_exec_level_table

.endif // OPTION_GIGALEAK_LEVELS
