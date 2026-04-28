#include "basicheader.h"

void render_star_count_dialog_text(s8 *xMatrix, s16 *linePos)
{
    s8 tensDigit = gDialogVariable / 10;
    s8 onesDigit = gDialogVariable - (tensDigit * 10); // remainder

    if (tensDigit != 0) {
        create_dl_translation_matrix(MENU_MTX_NOPUSH, 10 * *xMatrix, 0, 0);
        render_generic_char(tensDigit);
    }
    else {
        (*xMatrix)++;
    }

    create_dl_translation_matrix(MENU_MTX_NOPUSH, 10 * *xMatrix, 0, 0);
    render_generic_char(onesDigit);
    (*linePos)++;
    *xMatrix = 1;
}
