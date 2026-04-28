.ifdef OPTION_JP_FONT

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

// Segment 0x02

// ALIGNMENT AGH, inside bracketed address is ram address.

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
