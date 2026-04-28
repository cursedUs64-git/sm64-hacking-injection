#include "basicheader.h"

#define CUR_CHAR str[strPos]
#define MAX_STRING_WIDTH 18
#define CHAR_WIDTH_SPACE 5.0f
#define CHAR_WIDTH_DEFAULT 10.0f

/**
 * Prints a generic white string.
 * In JP/EU a IA1 texture is used but in US a IA4 texture is used.
 */
void print_generic_string(s16 x, s16 y, const u8 *str) {
    UNUSED s8 mark = DIALOG_MARK_NONE; // unused in EU
    s32 strPos = 0;
    u8 lineNum = 1;

    create_dl_translation_matrix(MENU_MTX_PUSH, x, y, 0.0f);

    while (str[strPos] != SPECIAL_CHAR(DIALOG_CHAR_TERMINATOR)) {
        switch (CUR_CHAR) {
            case SPECIAL_CHAR(DIALOG_CHAR_DAKUTEN):
                mark = DIALOG_MARK_DAKUTEN;
                break;
            case SPECIAL_CHAR(DIALOG_CHAR_PERIOD_OR_HANDAKUTEN):
                mark = DIALOG_MARK_HANDAKUTEN;
                break;
            case SPECIAL_CHAR(DIALOG_CHAR_NEWLINE):
                gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                create_dl_translation_matrix(MENU_MTX_PUSH, x, y - (lineNum * MAX_STRING_WIDTH), 0.0f);
                lineNum++;
                break;
            case SPECIAL_CHAR(DIALOG_CHAR_PERIOD):
                create_dl_translation_matrix(MENU_MTX_PUSH, -2.0f, -5.0f, 0.0f);
                render_generic_char(DIALOG_CHAR_PERIOD_OR_HANDAKUTEN);
                gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                break;


            case SPECIAL_CHAR(DIALOG_CHAR_SPACE):
                create_dl_translation_matrix(MENU_MTX_NOPUSH, CHAR_WIDTH_SPACE, 0.0f, 0.0f);
                break;
                break; // ? needed to match

            default:
                render_generic_char(CUR_CHAR);
                if (mark != DIALOG_MARK_NONE) {
                    create_dl_translation_matrix(MENU_MTX_PUSH, 5.0f, 5.0f, 0.0f);
                    render_generic_char(DIALOG_CHAR_MARK_START + mark);
                    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                    mark = DIALOG_MARK_NONE;
                }

                create_dl_translation_matrix(MENU_MTX_NOPUSH, CHAR_WIDTH_DEFAULT, 0.0f, 0.0f);
        }

        strPos++;
    }

    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}
