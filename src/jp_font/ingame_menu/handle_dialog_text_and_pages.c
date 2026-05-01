#include "basicheader.h"

#define X_VAL3 5.0f
#define Y_VAL3 20

extern s8 gMenuState;
extern s16 gNextDialogPageStartStrIndex;
extern s16 gDialogPageStartStrIndex;

extern void handle_dialog_scroll_page_state(s8 lineNum, s8 totalLines, s8 *pageState, s8 *xMatrix,
                                     s16 *linePos);
extern void render_star_count_dialog_text(s8 *xMatrix, s16 *linePos);

enum MenuState {
    MENU_STATE_0,
    MENU_STATE_1,
    MENU_STATE_2,
    MENU_STATE_3,
    MENU_STATE_DEFAULT = MENU_STATE_0,

    // Dialog
    MENU_STATE_DIALOG_OPENING = MENU_STATE_0,
    MENU_STATE_DIALOG_OPEN = MENU_STATE_1,
    MENU_STATE_DIALOG_SCROLLING = MENU_STATE_2,
    MENU_STATE_DIALOG_CLOSING = MENU_STATE_3,

    // Pause Screen
    MENU_STATE_PAUSE_SCREEN_OPENING = MENU_STATE_0,
    MENU_STATE_PAUSE_SCREEN_COURSE = MENU_STATE_1,
    MENU_STATE_PAUSE_SCREEN_CASTLE = MENU_STATE_2,

    // Course Complete Screen
    MENU_STATE_COURSE_COMPLETE_SCREEN_OPENING = MENU_STATE_0,
    MENU_STATE_COURSE_COMPLETE_SCREEN_OPEN = MENU_STATE_1
};

void cahstom_handle_dialog_text_and_pages(s8 colorMode, struct DialogEntry *dialog)
{
    UNUSED u64 filler;
    u8 strChar;
    u8 *str = segmented_to_virtual(dialog->str);
    s8 lineNum = 1;
    s8 totalLines;
    s8 pageState = DIALOG_PAGE_STATE_NONE;
    UNUSED s8 mark = DIALOG_MARK_NONE; // only used in JP and SH
    s8 xMatrix = 1;
    s8 linesPerBox = dialog->linesPerBox;
    s16 strIndex;
    s16 linePos = 0;

    if (gMenuState == MENU_STATE_DIALOG_SCROLLING) {
        // If scrolling, consider the number of lines for both
        // the current page and the page being scrolled to.
        totalLines = linesPerBox * 2 + 1;
    } else {
        totalLines = linesPerBox + 1;
    }

    gSPDisplayList(gDisplayListHead++, dl_ia_text_begin);

    strIndex = gDialogPageStartStrIndex;


    if (gMenuState == MENU_STATE_DIALOG_SCROLLING) {
        create_dl_translation_matrix(MENU_MTX_NOPUSH, 0, (f32) gDialogScrollOffsetY, 0);
    }

    create_dl_translation_matrix(MENU_MTX_PUSH, X_VAL3, 2 - lineNum * Y_VAL3, 0);

    while (pageState == DIALOG_PAGE_STATE_NONE) {
        change_and_flash_dialog_text_color_lines(colorMode, lineNum);

        strChar = str[strIndex];

        switch (strChar) {
            case SPECIAL_CHAR(DIALOG_CHAR_TERMINATOR):
                pageState = DIALOG_PAGE_STATE_END;
                gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                break;
            case SPECIAL_CHAR(DIALOG_CHAR_NEWLINE):
                lineNum++;
                handle_dialog_scroll_page_state(lineNum, totalLines, &pageState, &xMatrix, &linePos);
                break;

            case SPECIAL_CHAR(DIALOG_CHAR_DAKUTEN):
                mark = DIALOG_MARK_DAKUTEN;
                break;
            case SPECIAL_CHAR(DIALOG_CHAR_PERIOD_OR_HANDAKUTEN):
                mark = DIALOG_MARK_HANDAKUTEN;
                break;


            case SPECIAL_CHAR(DIALOG_CHAR_SPACE):
                if (linePos != 0) {
                    xMatrix++;
                }
                linePos++;
                break;

            case SPECIAL_CHAR(DIALOG_CHAR_PERIOD):
                adjust_pos_and_print_period_char(&xMatrix, &linePos);
                break;

            case SPECIAL_CHAR(DIALOG_CHAR_STAR_COUNT):
                render_star_count_dialog_text(&xMatrix, &linePos);
                break;


            default: // any other character
                    if (linePos != 0) {
                        create_dl_translation_matrix(MENU_MTX_NOPUSH, 10 * xMatrix, 0, 0);
                    }

                    render_generic_char(strChar);
                    xMatrix = 1;
                    linePos++;

                    if (mark != DIALOG_MARK_NONE) {
                        create_dl_translation_matrix(MENU_MTX_PUSH, 5.0f, 7.0f, 0);
                        render_generic_char(DIALOG_CHAR_MARK_START + mark);
                        gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                        mark = DIALOG_MARK_NONE;
                    }
        }

        if (linePos == 12) {
            if (str[strIndex + 1] == DIALOG_CHAR_PERIOD) {
                adjust_pos_and_print_period_char(&xMatrix, &linePos);
                strIndex++;
            }

            if (str[strIndex + 1] == DIALOG_CHAR_COMMA) {
                create_dl_translation_matrix(MENU_MTX_NOPUSH, 10 * xMatrix, 0, 0);
                render_generic_char(DIALOG_CHAR_COMMA);
                strIndex++;
            }

            if (str[strIndex + 1] == DIALOG_CHAR_NEWLINE) {
                strIndex++;
            }

            if (str[strIndex + 1] == DIALOG_CHAR_TERMINATOR) {
                pageState = DIALOG_PAGE_STATE_END;
                gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
                break; // exit loop
            } else {
                lineNum++;
                handle_dialog_scroll_page_state(lineNum, totalLines, &pageState, &xMatrix, &linePos);
            }
        }

        strIndex++;
    }

    gSPDisplayList(gDisplayListHead++, dl_ia_text_end);

    if (gMenuState == MENU_STATE_DIALOG_OPEN) {
        if (pageState == DIALOG_PAGE_STATE_END) {
            gNextDialogPageStartStrIndex = -1;
        } else {
            gNextDialogPageStartStrIndex = strIndex;
        }
    }

    gLastDialogLineNum = lineNum;
}
