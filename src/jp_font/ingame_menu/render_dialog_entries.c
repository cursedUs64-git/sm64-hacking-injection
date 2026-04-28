#include "basicheader.h"

extern s16 gDialogID;
extern s8 gMenuState;
extern s8 gMenuLineNum;
extern s8 gDialogWithChoice;
extern s8 gDialogBoxType;
extern f32 gDialogBoxAngle;
extern f32 gDialogBoxScale;
extern s16 gNextDialogPageStartStrIndex;
extern s16 gDialogPageStartStrIndex;
extern s16 gDialogScrollOffsetY;
#define DIALOG_BOX_ANGLE_DEFAULT 90.0f
#define DIALOG_BOX_SCALE_DEFAULT 19.0f

enum DialogBoxType {
    DIALOG_TYPE_ROTATE, // used in NPCs and level messages
    DIALOG_TYPE_ZOOM    // used in signposts and wall signs and etc
};

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

#define DIAG_VAL1 20
#define DIAG_VAL2 240
#define DIAG_VAL3 130
#define DIAG_VAL4 4

void render_dialog_entries(void) {
    void **dialogTable;
    struct DialogEntry *dialog;

    dialogTable = segmented_to_virtual(seg2_dialog_table);
    dialog = segmented_to_virtual(dialogTable[gDialogID]);

    // if the dialog entry is invalid, set the ID to DIALOG_NONE.
    if (dialog == segmented_to_virtual(NULL)) {
        gDialogID = DIALOG_NONE;
        return;
    }


    switch (gMenuState) {
        case MENU_STATE_DIALOG_OPENING:
            if (gDialogBoxAngle == DIALOG_BOX_ANGLE_DEFAULT) {
                play_dialog_sound(gDialogID);
                play_sound(SOUND_MENU_MESSAGE_APPEAR, gGlobalSoundSource);
            }

            if (gDialogBoxType == DIALOG_TYPE_ROTATE) {
                gDialogBoxAngle -= 7.5;
                gDialogBoxScale -= 1.5;
            } else {
                gDialogBoxAngle -= 10.0;
                gDialogBoxScale -= 2.0;
            }

            if (gDialogBoxAngle == 0.0f) {
                gMenuState = MENU_STATE_DIALOG_OPEN;
                gMenuLineNum = 1;
            }
            break;

        case MENU_STATE_DIALOG_OPEN:
            gDialogBoxAngle = 0.0f;

            if ((gPlayer3Controller->buttonPressed & A_BUTTON)
                || (gPlayer3Controller->buttonPressed & B_BUTTON)) {
                if (gNextDialogPageStartStrIndex == -1) {
                    handle_special_dialog_text(gDialogID);
                    gMenuState = MENU_STATE_DIALOG_CLOSING;
                } else {
                    gMenuState = MENU_STATE_DIALOG_SCROLLING;
                    play_sound(SOUND_MENU_MESSAGE_NEXT_PAGE, gGlobalSoundSource);
                }
            }
            break;

        case MENU_STATE_DIALOG_SCROLLING:
            gDialogScrollOffsetY += dialog->linesPerBox * 2;

            if (gDialogScrollOffsetY >= dialog->linesPerBox * DIAG_VAL1) {
                gDialogPageStartStrIndex = gNextDialogPageStartStrIndex;
                gMenuState = MENU_STATE_DIALOG_OPEN;
                gDialogScrollOffsetY = 0;
            }
            break;

        case MENU_STATE_DIALOG_CLOSING:
            if (gDialogBoxAngle == 20.0f) {
                level_set_transition(0, NULL);
                play_sound(SOUND_MENU_MESSAGE_DISAPPEAR, gGlobalSoundSource);

                if (gDialogBoxType == DIALOG_TYPE_ZOOM) {
                    trigger_cutscene_dialog(2);
                }

                gDialogResponse = gMenuLineNum;
            }

            gDialogBoxAngle += 10.0f;
            gDialogBoxScale += 2.0f;

            if (gDialogBoxAngle == DIALOG_BOX_ANGLE_DEFAULT) {
                gMenuState = MENU_STATE_DEFAULT;
                gDialogID = DIALOG_NONE;
                gDialogPageStartStrIndex = 0;
                gDialogWithChoice = FALSE;
                gNextDialogPageStartStrIndex = 0;
                gDialogResponse = DIALOG_RESPONSE_NONE;
            }
            break;
    }

    render_dialog_box_type(dialog, dialog->linesPerBox);

    gDPSetScissor(gDisplayListHead++, G_SC_NON_INTERLACE,
                  ensure_nonnegative(dialog->leftOffset),
                  ensure_nonnegative(DIAG_VAL2 - dialog->width),
                  ensure_nonnegative(dialog->leftOffset + DIAG_VAL3),
                  ensure_nonnegative((240 - dialog->width) + (dialog->linesPerBox * 80 / DIAG_VAL4))
    );

    cahstom_handle_dialog_text_and_pages(0, dialog);

    if (gNextDialogPageStartStrIndex == -1 && gDialogWithChoice == TRUE) {
        render_dialog_triangle_choice();
    }

    gDPSetScissor(gDisplayListHead++, G_SC_NON_INTERLACE, 2, 2, SCREEN_WIDTH,
                  SCREEN_HEIGHT);

    if (gNextDialogPageStartStrIndex != -1 && gMenuState == MENU_STATE_DIALOG_OPEN) {
        render_dialog_triangle_next(dialog->linesPerBox);
    }
}
