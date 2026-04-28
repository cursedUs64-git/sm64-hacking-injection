// RM function, replacement for get_quad_collection_from_id
.definelabel rm_stub3000, 0x80403000

.headersize 0x80400000-0x1200000
.org 0x80403760 // free space in mangler
.area 0x80410000-0x80403760

.importobj "obj/act_idle/act_idle.o"

.ifdef OPTION_JP_FONT
.importobj "obj/jp_font/sex2/hooks/misc_hud_chars.o"
.importobj "obj/jp_font/ingame_menu/get_str_x_pos_from_center_scale.o"
.importobj "obj/jp_font/ingame_menu/adjust_pos_and_print_period_char.o"
.importobj "obj/jp_font/ingame_menu/handle_dialog_text_and_pages.o"
.endif

.ifdef OPTION_GIGALEAK_LEVELS
// In order,
;  geo loads leveldata.
;  leveldata and other stuff, loaded by script.
;  script loaded by script_exec
.importobj "obj/custom/custom_script_exec_level_table.o"

// movtex for water
.importobj "obj/custom/movtex_castle.o"
; was JAL rm_stub3000 (see RM-Decomp for more info).
; this still jumps to that function
; but, one check has been added for movtex of gigaleak castle water
.headersize SEC_MAIN_HEADERSIZE
; geo_movtex_draw_water_regions
.org 0x802D11AC :: JAL gigaleak_cattle_get_quad_collection_from_id ; was JAL rm_stub3000 (see RM-Decomp for more info)

.endif ; OPTION_GIGALEAK_LEVELS

.endarea
