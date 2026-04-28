#include "basicheader.h"

void adjust_pos_and_print_period_char(s8 *xMatrix, s16 *linePos) {
    if (*linePos != 0) {
        create_dl_translation_matrix(MENU_MTX_NOPUSH, 10 * *xMatrix, 0, 0);
    }

    create_dl_translation_matrix(MENU_MTX_PUSH, -2.0f, -5.0f, 0);
    render_generic_char(DIALOG_CHAR_PERIOD_OR_HANDAKUTEN);

    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);

    (*linePos)++;
    *xMatrix = 1;
}
