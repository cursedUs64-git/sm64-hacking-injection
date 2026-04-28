.ifdef OPTION_JP_FONT

.sym off
.definelabel texture_hud_char_0, 0x02000000
.definelabel texture_hud_char_1, 0x02000200
.definelabel texture_hud_char_2, 0x02000400
.definelabel texture_hud_char_3, 0x02000600
.definelabel texture_hud_char_4, 0x02000800
.definelabel texture_hud_char_5, 0x02000a00
.definelabel texture_hud_char_6, 0x02000c00
.definelabel texture_hud_char_7, 0x02000e00
.definelabel texture_hud_char_8, 0x02001000
.definelabel texture_hud_char_9, 0x02001200
.definelabel texture_hud_char_A, 0x02001400
.definelabel texture_hud_char_B, 0x02001600
.definelabel texture_hud_char_C, 0x02001800
.definelabel texture_hud_char_D, 0x02001a00
.definelabel texture_hud_char_E, 0x02001c00
.definelabel texture_hud_char_F, 0x02001e00
.definelabel texture_hud_char_G, 0x02002000
.definelabel texture_hud_char_H, 0x02002200
.definelabel texture_hud_char_I, 0x02002400
.definelabel texture_hud_char_K, 0x02002600
.definelabel texture_hud_char_L, 0x02002800
.definelabel texture_hud_char_M, 0x02002a00
.definelabel texture_hud_char_N, 0x02002c00
.definelabel texture_hud_char_O, 0x02002e00
.definelabel texture_hud_char_P, 0x02003000
.definelabel texture_hud_char_R, 0x02003200
.definelabel texture_hud_char_S, 0x02003400
.definelabel texture_hud_char_T, 0x02003600
.definelabel texture_hud_char_U, 0x02003800
.definelabel texture_hud_char_W, 0x02003a00
.definelabel texture_hud_char_Y, 0x02003c00
.definelabel texture_hud_char_apostrophe, 0x02003e00
.definelabel texture_hud_char_double_quote, 0x02004000
.definelabel texture_hud_char_multiply, 0x02004200
.definelabel texture_hud_char_coin, 0x02004400
.definelabel texture_hud_char_mario_head, 0x02004600
.definelabel texture_hud_char_star, 0x02004800

.definelabel main_hud_lut, 0x02007700
.definelabel main_font_lut, 0x020077e8
.definelabel seg2_dialog_table, 0x02010a68
.definelabel dl_ia_text_begin, 0x02011cc8
.definelabel dl_ia_text_tex_settings, 0x02011d08
.definelabel dl_ia_text_end, 0x02011d50
.definelabel dl_rgba16_load_tex_block, 0x02011b98
.definelabel dl_draw_text_bg_box, 0x02011c48
.definelabel dl_draw_triangle, 0x02011dc0
.definelabel vertex_ia8_char, 0x02011c88

.definelabel menu_hud_lut, 0x0700abd0
.definelabel menu_font_lut, 0x0700b840
.sym on

// Segment 0x02

// ALIGNMENT AGH

.sym off

.headersize 2
/* vertex_ia8_char */
.orga 0x803156+0x11c88
.area 0x02011cc8 - 0x02011c88, 0
.importobj "obj/jp_font/sex2/hooks/vertex_ia8_char.o"
.endarea

/* dl_ia_text_begin */
.orga 0x803156+0x11cc8
.area 0x02011d08 - 0x02011cc8, 0
.importobj "obj/jp_font/sex2/hooks/dl_ia_text_begin.o"
.endarea

.sym on

/* dl_ia_text_tex_settings */
; IDO CC aligns shit so i have to do ts by hex.
; check dl_ia_text_text_settings.c to see what this does.
; was gonna copy from objdump then i realised... ADDRESS RESOLVING
.orga 0x803156+0x11d08
; .area 0x02011d50 - 0x02011d08, 0
.word 0xF5680000, 0x07090230, 0xE6000000, 0x00000000, 0xF3000000, 0x0707F800 , 0xF5680200, 0x00090230, 0xF2000000, 0x0001C03C, 0x04300040, vertex_ia8_char, 0xBF000000, 0x00000A14, 0xBF000000, 0x0000141E, 0xB8000000, 0x00000000
; .endarea

.headersize 0x02000000-0x803156
/* texture_font_char_us_0 - texture_hud_char_camera */
.org 0x02005900
.area 0x02007000 - 0x02005900, 0
.importobj "obj/jp_font/sex2/hooks/texture_font_chars_jp.o"
.endarea

// LUTs will be done using .word fuck you
.headersize 0x02000000-0x803156
/* main_hud_lut */
.org 0x02007700
.area 0x020077e8 - 0x02007700, 0
.word texture_hud_char_0, \
texture_hud_char_1, \
texture_hud_char_2, \
texture_hud_char_3, \
texture_hud_char_4, \
texture_hud_char_5, \
texture_hud_char_6, \
texture_hud_char_7, \
texture_hud_char_8, \
texture_hud_char_9, \
texture_hud_char_A, \
texture_hud_char_B, \
texture_hud_char_C, \
texture_hud_char_D, \
texture_hud_char_E, \
texture_hud_char_F, \
texture_hud_char_G, \
texture_hud_char_H, \
texture_hud_char_I, \
texture_hud_char_J, \
texture_hud_char_K, \
texture_hud_char_L, \
texture_hud_char_M, \
texture_hud_char_N, \
texture_hud_char_O, \
texture_hud_char_P, \
texture_hud_char_Q, \
texture_hud_char_R, \
texture_hud_char_S, \
texture_hud_char_T, \
texture_hud_char_U, \
texture_hud_char_V, \
texture_hud_char_W, \
texture_hud_char_X, \
texture_hud_char_Y, \
texture_hud_char_Z, \
texture_hud_char_exclamation, \
texture_hud_char_double_exclamation, \
texture_hud_char_question, \
texture_hud_char_ampersand, \
texture_hud_char_percent, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
texture_hud_char_multiply, \
texture_hud_char_coin, \
texture_hud_char_mario_head, \
texture_hud_char_star, \
texture_hud_char_decimal_point, \
texture_hud_char_beta_key, \
texture_hud_char_apostrophe, \
texture_hud_char_double_quote
.endarea

/* main_font_lut */
.org 0x020077e8
.area 0x02007be8 - 0x020077e8, 0
.word texture_font_char_jp_0, \
texture_font_char_jp_1, \
texture_font_char_jp_2, \
texture_font_char_jp_3, \
texture_font_char_jp_4, \
texture_font_char_jp_5, \
texture_font_char_jp_6, \
texture_font_char_jp_7, \
texture_font_char_jp_8, \
texture_font_char_jp_9, \
texture_font_char_jp_A, \
texture_font_char_jp_B, \
texture_font_char_jp_C, \
texture_font_char_jp_D, \
texture_font_char_jp_E, \
texture_font_char_jp_F, \
texture_font_char_jp_G, \
texture_font_char_jp_H, \
texture_font_char_jp_I, \
texture_font_char_jp_J, \
texture_font_char_jp_K, \
texture_font_char_jp_L, \
texture_font_char_jp_M, \
texture_font_char_jp_N, \
texture_font_char_jp_O, \
texture_font_char_jp_P, \
texture_font_char_jp_Q, \
texture_font_char_jp_R, \
texture_font_char_jp_S, \
texture_font_char_jp_T, \
texture_font_char_jp_U, \
texture_font_char_jp_V, \
texture_font_char_jp_W, \
texture_font_char_jp_X, \
texture_font_char_jp_Y, \
texture_font_char_jp_Z, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
texture_font_char_jp_hiragana_a, \
texture_font_char_jp_hiragana_i, \
texture_font_char_jp_hiragana_u, \
texture_font_char_jp_hiragana_c, \
texture_font_char_jp_hiragana_o, \
texture_font_char_jp_hiragana_ka, \
texture_font_char_jp_hiragana_ki, \
texture_font_char_jp_hiragana_ku, \
texture_font_char_jp_hiragana_ke, \
texture_font_char_jp_hiragana_ko, \
texture_font_char_jp_hiragana_sa, \
texture_font_char_jp_hiragana_shi, \
texture_font_char_jp_hiragana_su, \
texture_font_char_jp_hiragana_se, \
texture_font_char_jp_hiragana_so, \
texture_font_char_jp_hiragana_ta, \
texture_font_char_jp_hiragana_chi, \
texture_font_char_jp_hiragana_tsu, \
texture_font_char_jp_hiragana_te, \
texture_font_char_jp_hiragana_to, \
texture_font_char_jp_hiragana_na, \
texture_font_char_jp_hiragana_ni, \
texture_font_char_jp_hiragana_nu, \
texture_font_char_jp_hiragana_ne, \
texture_font_char_jp_hiragana_no, \
texture_font_char_jp_hiragana_ha, \
texture_font_char_jp_hiragana_hi, \
texture_font_char_jp_hiragana_hu, \
texture_font_char_jp_hiragana_he, \
texture_font_char_jp_hiragana_ho, \
texture_font_char_jp_hiragana_ma, \
texture_font_char_jp_hiragana_mi, \
texture_font_char_jp_hiragana_mu, \
texture_font_char_jp_hiragana_me, \
texture_font_char_jp_hiragana_mo, \
texture_font_char_jp_hiragana_ya, \
texture_font_char_jp_hiragana_yu, \
texture_font_char_jp_hiragana_yo, \
texture_font_char_jp_hiragana_ra, \
texture_font_char_jp_hiragana_ri, \
texture_font_char_jp_hiragana_ru, \
texture_font_char_jp_hiragana_re, \
texture_font_char_jp_hiragana_ro, \
texture_font_char_jp_hiragana_wa, \
texture_font_char_jp_hiragana_wo, \
texture_font_char_jp_hiragana_n, \
0x0, \
texture_font_char_jp_comma, \
texture_font_char_jp_katakana_a, \
texture_font_char_jp_katakana_i, \
texture_font_char_jp_katakana_u, \
texture_font_char_jp_katakana_e, \
texture_font_char_jp_katakana_o, \
texture_font_char_jp_katakana_ka, \
texture_font_char_jp_katakana_ki, \
texture_font_char_jp_katakana_ku, \
texture_font_char_jp_katakana_ke, \
texture_font_char_jp_katakana_ko, \
texture_font_char_jp_katakana_sa, \
texture_font_char_jp_katakana_shi, \
texture_font_char_jp_katakana_su, \
texture_font_char_jp_katakana_se, \
texture_font_char_jp_katakana_so, \
texture_font_char_jp_katakana_ta, \
texture_font_char_jp_katakana_chi, \
texture_font_char_jp_katakana_tsu, \
texture_font_char_jp_katakana_te, \
texture_font_char_jp_katakana_to, \
texture_font_char_jp_katakana_na, \
texture_font_char_jp_katakana_ni, \
texture_font_char_jp_katakana_nu, \
texture_font_char_jp_katakana_ne, \
texture_font_char_jp_katakana_no, \ 
texture_font_char_jp_katakana_ha, \
texture_font_char_jp_katakana_hi, \
texture_font_char_jp_katakana_hu, \
texture_font_char_jp_katakana_he, \
texture_font_char_jp_katakana_ho, \
texture_font_char_jp_katakana_ma, \
texture_font_char_jp_katakana_mi, \
texture_font_char_jp_katakana_mu, \
texture_font_char_jp_katakana_me, \
texture_font_char_jp_katakana_mo, \
texture_font_char_jp_katakana_ya, \
texture_font_char_jp_katakana_yu, \
texture_font_char_jp_katakana_yo, \
texture_font_char_jp_katakana_ra, \
texture_font_char_jp_katakana_ri, \
texture_font_char_jp_katakana_ru, \
texture_font_char_jp_katakana_re, \
texture_font_char_jp_katakana_ro, \
texture_font_char_jp_katakana_wa, \
0x0, \
texture_font_char_jp_katakana_n, \
0x0, \
texture_font_char_jp_long_vowel, \
texture_font_char_jp_hiragana_small_e, \
texture_font_char_jp_hiragana_small_tsu, \
texture_font_char_jp_hiragana_small_ya, \
texture_font_char_jp_hiragana_small_yu, \
texture_font_char_jp_hiragana_small_yo, \
texture_font_char_jp_hiragana_small_a, \
texture_font_char_jp_hiragana_small_i, \
texture_font_char_jp_hiragana_small_u, \
texture_font_char_jp_hiragana_small_o, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
texture_font_char_jp_katakana_small_e, \
texture_font_char_jp_katakana_small_tsu, \
texture_font_char_jp_katakana_small_ya, \
texture_font_char_jp_katakana_small_yu, \
texture_font_char_jp_katakana_small_yo, \
texture_font_char_jp_katakana_small_a, \
texture_font_char_jp_katakana_small_i, \
texture_font_char_jp_katakana_small_u, \
texture_font_char_jp_katakana_small_o, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
texture_font_char_jp_open_parentheses, \
texture_font_char_jp_close_open_parentheses, \
texture_font_char_jp_close_parentheses, \
texture_font_char_jp_left_right_arrow, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
0x0, \
texture_font_char_jp_dakuten, \
texture_font_char_jp_handakuten, \
texture_font_char_jp_exclamation, \
texture_font_char_jp_percent, \
texture_font_char_jp_question, \
texture_font_char_jp_double_quotation_open, \
texture_font_char_jp_double_quotation_close, \
texture_font_char_jp_wave_dash, \
texture_font_char_jp_ellipsis, \
texture_font_char_jp_coin, \
texture_font_char_jp_star_filled, \
texture_font_char_jp_multiply, \
texture_font_char_jp_interpunct, \
texture_font_char_jp_star_hollow, \
0x0, \
0x0
.endarea

/* dialog_text_DIALOG_000 - seg2_dialog_table */
.org 0x02007d34
.area 0x02010a68 - 0x02007d34, 0
.importobj "obj/jp_font/sex2/hooks/define_dialog.o"
.endarea

/* seg2_dialog_table */
.org 0x02010a68
.area 0x02010d14 - 0x02010a68, 0
.word \
dialog_entry_DIALOG_000, \
dialog_entry_DIALOG_001, \
dialog_entry_DIALOG_002, \
dialog_entry_DIALOG_003, \
dialog_entry_DIALOG_004, \
dialog_entry_DIALOG_005, \
dialog_entry_DIALOG_006, \
dialog_entry_DIALOG_007, \
dialog_entry_DIALOG_008, \
dialog_entry_DIALOG_009, \
dialog_entry_DIALOG_010, \
dialog_entry_DIALOG_011, \
dialog_entry_DIALOG_012, \
dialog_entry_DIALOG_013, \
dialog_entry_DIALOG_014, \
dialog_entry_DIALOG_015, \
dialog_entry_DIALOG_016, \
dialog_entry_DIALOG_017, \
dialog_entry_DIALOG_018, \
dialog_entry_DIALOG_019, \
dialog_entry_DIALOG_020, \
dialog_entry_DIALOG_021, \
dialog_entry_DIALOG_022, \
dialog_entry_DIALOG_023, \
dialog_entry_DIALOG_024, \
dialog_entry_DIALOG_025, \
dialog_entry_DIALOG_026, \
dialog_entry_DIALOG_027, \
dialog_entry_DIALOG_028, \
dialog_entry_DIALOG_029, \
dialog_entry_DIALOG_030, \
dialog_entry_DIALOG_031, \
dialog_entry_DIALOG_032, \
dialog_entry_DIALOG_033, \
dialog_entry_DIALOG_034, \
dialog_entry_DIALOG_035, \
dialog_entry_DIALOG_036, \
dialog_entry_DIALOG_037, \
dialog_entry_DIALOG_038, \
dialog_entry_DIALOG_039, \
dialog_entry_DIALOG_040, \
dialog_entry_DIALOG_041, \
dialog_entry_DIALOG_042, \
dialog_entry_DIALOG_043, \
dialog_entry_DIALOG_044, \
dialog_entry_DIALOG_045, \
dialog_entry_DIALOG_046, \
dialog_entry_DIALOG_047, \
dialog_entry_DIALOG_048, \
dialog_entry_DIALOG_049, \
dialog_entry_DIALOG_050, \
dialog_entry_DIALOG_051, \
dialog_entry_DIALOG_052, \
dialog_entry_DIALOG_053, \
dialog_entry_DIALOG_054, \
dialog_entry_DIALOG_055, \
dialog_entry_DIALOG_056, \
dialog_entry_DIALOG_057, \
dialog_entry_DIALOG_058, \
dialog_entry_DIALOG_059, \
dialog_entry_DIALOG_060, \
dialog_entry_DIALOG_061, \
dialog_entry_DIALOG_062, \
dialog_entry_DIALOG_063, \
dialog_entry_DIALOG_064, \
dialog_entry_DIALOG_065, \
dialog_entry_DIALOG_066, \
dialog_entry_DIALOG_067, \
dialog_entry_DIALOG_068, \
dialog_entry_DIALOG_069, \
dialog_entry_DIALOG_070, \
dialog_entry_DIALOG_071, \
dialog_entry_DIALOG_072, \
dialog_entry_DIALOG_073, \
dialog_entry_DIALOG_074, \
dialog_entry_DIALOG_075, \
dialog_entry_DIALOG_076, \
dialog_entry_DIALOG_077, \
dialog_entry_DIALOG_078, \
dialog_entry_DIALOG_079, \
dialog_entry_DIALOG_080, \
dialog_entry_DIALOG_081, \
dialog_entry_DIALOG_082, \
dialog_entry_DIALOG_083, \
dialog_entry_DIALOG_084, \
dialog_entry_DIALOG_085, \
dialog_entry_DIALOG_086, \
dialog_entry_DIALOG_087, \
dialog_entry_DIALOG_088, \
dialog_entry_DIALOG_089, \
dialog_entry_DIALOG_090, \
dialog_entry_DIALOG_091, \
dialog_entry_DIALOG_092, \
dialog_entry_DIALOG_093, \
dialog_entry_DIALOG_094, \
dialog_entry_DIALOG_095, \
dialog_entry_DIALOG_096, \
dialog_entry_DIALOG_097, \
dialog_entry_DIALOG_098, \
dialog_entry_DIALOG_099, \
dialog_entry_DIALOG_100, \
dialog_entry_DIALOG_101, \
dialog_entry_DIALOG_102, \
dialog_entry_DIALOG_103, \
dialog_entry_DIALOG_104, \
dialog_entry_DIALOG_105, \
dialog_entry_DIALOG_106, \
dialog_entry_DIALOG_107, \
dialog_entry_DIALOG_108, \
dialog_entry_DIALOG_109, \
dialog_entry_DIALOG_110, \
dialog_entry_DIALOG_111, \
dialog_entry_DIALOG_112, \
dialog_entry_DIALOG_113, \
dialog_entry_DIALOG_114, \
dialog_entry_DIALOG_115, \
dialog_entry_DIALOG_116, \
dialog_entry_DIALOG_117, \
dialog_entry_DIALOG_118, \
dialog_entry_DIALOG_119, \
dialog_entry_DIALOG_120, \
dialog_entry_DIALOG_121, \
dialog_entry_DIALOG_122, \
dialog_entry_DIALOG_123, \
dialog_entry_DIALOG_124, \
dialog_entry_DIALOG_125, \
dialog_entry_DIALOG_126, \
dialog_entry_DIALOG_127, \
dialog_entry_DIALOG_128, \
dialog_entry_DIALOG_129, \
dialog_entry_DIALOG_130, \
dialog_entry_DIALOG_131, \
dialog_entry_DIALOG_132, \
dialog_entry_DIALOG_133, \
dialog_entry_DIALOG_134, \
dialog_entry_DIALOG_135, \
dialog_entry_DIALOG_136, \
dialog_entry_DIALOG_137, \
dialog_entry_DIALOG_138, \
dialog_entry_DIALOG_139, \
dialog_entry_DIALOG_140, \
dialog_entry_DIALOG_141, \
dialog_entry_DIALOG_142, \
dialog_entry_DIALOG_143, \
dialog_entry_DIALOG_144, \
dialog_entry_DIALOG_145, \
dialog_entry_DIALOG_146, \
dialog_entry_DIALOG_147, \
dialog_entry_DIALOG_148, \
dialog_entry_DIALOG_149, \
dialog_entry_DIALOG_150, \
dialog_entry_DIALOG_151, \
dialog_entry_DIALOG_152, \
dialog_entry_DIALOG_153, \
dialog_entry_DIALOG_154, \
dialog_entry_DIALOG_155, \
dialog_entry_DIALOG_156, \
dialog_entry_DIALOG_157, \
dialog_entry_DIALOG_158, \
dialog_entry_DIALOG_159, \
dialog_entry_DIALOG_160, \
dialog_entry_DIALOG_161, \
dialog_entry_DIALOG_162, \
dialog_entry_DIALOG_163, \
dialog_entry_DIALOG_164, \
dialog_entry_DIALOG_165, \
dialog_entry_DIALOG_166, \
dialog_entry_DIALOG_167, \
dialog_entry_DIALOG_168, \
dialog_entry_DIALOG_169, \
    0x0
.endarea

/* seg2_course_name_table_COURSE_BOB - seg2_course_name_table*/
.org 0x02010d14
.area 0x02010f68 - 0x02010d14, 0
.importobj "obj/jp_font/sex2/hooks/define_course.o"
.endarea

/* seg2_course_name_table */
.org 0x02010f68
.area 0x02010fd4 - 0x02010f68, 0
.word \
seg2_course_name_table_COURSE_BOB, \
seg2_course_name_table_COURSE_WF, \
seg2_course_name_table_COURSE_JRB, \
seg2_course_name_table_COURSE_CCM, \
seg2_course_name_table_COURSE_BBH, \
seg2_course_name_table_COURSE_HMC, \
seg2_course_name_table_COURSE_LLL, \
seg2_course_name_table_COURSE_SSL, \
seg2_course_name_table_COURSE_DDD, \
seg2_course_name_table_COURSE_SL, \
seg2_course_name_table_COURSE_WDW, \
seg2_course_name_table_COURSE_TTM, \
seg2_course_name_table_COURSE_THI, \
seg2_course_name_table_COURSE_TTC, \
seg2_course_name_table_COURSE_RR, \
seg2_course_name_table_COURSE_BITDW, \
seg2_course_name_table_COURSE_BITFS, \
seg2_course_name_table_COURSE_BITS, \
seg2_course_name_table_COURSE_PSS, \
seg2_course_name_table_COURSE_COTMC, \
seg2_course_name_table_COURSE_TOTWC, \
seg2_course_name_table_COURSE_VCUTM, \
seg2_course_name_table_COURSE_WMOTR, \
seg2_course_name_table_COURSE_SA, \
seg2_course_name_table_COURSE_CAKE_END, \
seg2_course_name_table_castle_secret_stars, \
    0x0
.endarea

/* act_name_COURSE_BOB_1 - seg2_act_name_table */
.org 0x02010fd4
.area 0x0201192c - 0x02010fd4, 0
.importobj "obj/jp_font/sex2/hooks/define_act.o"
.endarea

/* seg2_act_name_table */
.org 0x0201192c
.area 0x02011ab8 - 0x0201192c, 0
.word \
act_name_COURSE_BOB_1, act_name_COURSE_BOB_2, act_name_COURSE_BOB_3, act_name_COURSE_BOB_4, act_name_COURSE_BOB_5, act_name_COURSE_BOB_6, \
act_name_COURSE_WF_1, act_name_COURSE_WF_2, act_name_COURSE_WF_3, act_name_COURSE_WF_4, act_name_COURSE_WF_5, act_name_COURSE_WF_6, \
act_name_COURSE_JRB_1, act_name_COURSE_JRB_2, act_name_COURSE_JRB_3, act_name_COURSE_JRB_4, act_name_COURSE_JRB_5, act_name_COURSE_JRB_6, \
act_name_COURSE_CCM_1, act_name_COURSE_CCM_2, act_name_COURSE_CCM_3, act_name_COURSE_CCM_4, act_name_COURSE_CCM_5, act_name_COURSE_CCM_6, \
act_name_COURSE_BBH_1, act_name_COURSE_BBH_2, act_name_COURSE_BBH_3, act_name_COURSE_BBH_4, act_name_COURSE_BBH_5, act_name_COURSE_BBH_6, \
act_name_COURSE_HMC_1, act_name_COURSE_HMC_2, act_name_COURSE_HMC_3, act_name_COURSE_HMC_4, act_name_COURSE_HMC_5, act_name_COURSE_HMC_6, \
act_name_COURSE_LLL_1, act_name_COURSE_LLL_2, act_name_COURSE_LLL_3, act_name_COURSE_LLL_4, act_name_COURSE_LLL_5, act_name_COURSE_LLL_6, \
act_name_COURSE_SSL_1, act_name_COURSE_SSL_2, act_name_COURSE_SSL_3, act_name_COURSE_SSL_4, act_name_COURSE_SSL_5, act_name_COURSE_SSL_6, \
act_name_COURSE_DDD_1, act_name_COURSE_DDD_2, act_name_COURSE_DDD_3, act_name_COURSE_DDD_4, act_name_COURSE_DDD_5, act_name_COURSE_DDD_6, \
act_name_COURSE_SL_1, act_name_COURSE_SL_2, act_name_COURSE_SL_3, act_name_COURSE_SL_4, act_name_COURSE_SL_5, act_name_COURSE_SL_6, \
act_name_COURSE_WDW_1, act_name_COURSE_WDW_2, act_name_COURSE_WDW_3, act_name_COURSE_WDW_4, act_name_COURSE_WDW_5, act_name_COURSE_WDW_6, \
act_name_COURSE_TTM_1, act_name_COURSE_TTM_2, act_name_COURSE_TTM_3, act_name_COURSE_TTM_4, act_name_COURSE_TTM_5, act_name_COURSE_TTM_6, \
act_name_COURSE_THI_1, act_name_COURSE_THI_2, act_name_COURSE_THI_3, act_name_COURSE_THI_4, act_name_COURSE_THI_5, act_name_COURSE_THI_6, \
act_name_COURSE_TTC_1, act_name_COURSE_TTC_2, act_name_COURSE_TTC_3, act_name_COURSE_TTC_4, act_name_COURSE_TTC_5, act_name_COURSE_TTC_6, \
act_name_COURSE_RR_1, act_name_COURSE_RR_2, act_name_COURSE_RR_3, act_name_COURSE_RR_4, act_name_COURSE_RR_5, act_name_COURSE_RR_6, \
extra_text_0, \
extra_text_1, \
extra_text_2, \
extra_text_3, \
extra_text_4, \
extra_text_5, \
extra_text_6, \
    0x0
.endarea

.headersize SEC_MAIN_HEADERSIZE

/* render_generic_char */
.org 0x802d75dc
.area 0x802d76c8 - 0x802d75dc, 0
.importobj "obj/jp_font/ingame_menu/render_generic_char.o"
.endarea

/* print_generic_string */
.org 0x802d77dc
.area 0x802d7b84 - 0x802d77dc, 0
.importobj "obj/jp_font/ingame_menu/print_generic_string.o"
.endarea

// NOTE! below two are commented as dey arent related to dialog
/* print_hud_lut_string */
; .org 0x802d7b84
; .area 0x802d7e88 - 0x802d7b84, 0
; .importobj "obj/jp_font/ingame_menu/print_hud_lut_string.o"
; .endarea

/* print_menu_generic_string */
; .org 0x802d7e88
; .area 0x802d82d4 - 0x802d7e88, 0
; .importobj "obj/jp_font/ingame_menu/print_menu_generic_string.o"
; .endarea

/* get_str_x_pos_from_center */
.org 0x802d8844
.area 0x802d8934 - 0x802d8844, 0
J get_str_x_pos_from_center_scale
NOP
.endarea

// NOTE! black and white bg dont render fsr...
/* render_dialog_box_type */
.org 0x802d8e2c
.area 0x802d9148 - 0x802d8e2c, 0
.importobj "obj/jp_font/ingame_menu/render_dialog_box_type.o"
.endarea

.headersize SEC_MAIN_HEADERSIZE

/* handle_dialog_scroll_page_state */
.org 0x802d9388
.area 0x802d944c - 0x802d9388, 0
.importobj "obj/jp_font/ingame_menu/handle_dialog_scroll_page_state.o"
.endarea

/* render_star_count_dialog_text */
.org 0x802d944c
.area 0x802d9634 - 0x802d944c, 0
.importobj "obj/jp_font/ingame_menu/render_star_count_dialog_text.o"
.endarea

/* handle_dialog_text_and_pages */
.org 0x802d982c
.area 0x802d9cb0 - 0x802d982c, 0
J cahstom_handle_dialog_text_and_pages
NOP
.endarea

// NOTE! below three, problematic? idk why
/* render_dialog_triangle_choice */
.org 0x802d9cb0
.area 0x802d9dfc - 0x802d9cb0, 0
.importobj "obj/jp_font/ingame_menu/render_dialog_triangle_choice.o"
.endarea

/* render_dialog_triangle_next */
.org 0x802d9dfc
.area 0x802d9f84 - 0x802d9dfc, 0
.importobj "obj/jp_font/ingame_menu/render_dialog_triangle_next.o"
.endarea

/* render_dialog_entries */
.org 0x802da1ac
.area 0x802da810 - 0x802da1ac, 0
.importobj "obj/jp_font/ingame_menu/render_dialog_entries.o"
.endarea

.endif
