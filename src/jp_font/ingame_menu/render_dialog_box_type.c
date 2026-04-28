#include "basicheader.h"

extern s8 gDialogBoxType;
extern s8 gMenuState;
extern f32 gDialogBoxAngle;
extern f32 gDialogBoxScale;

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

#define X_VAL1 -7.0f
#define Y_VAL1 5.0
#define Y_VAL2 5.0f

void cahstom_render_dialog_box_type(struct DialogEntry *dialog, s8 linesPerBox) {
    // UNUSED u8 filler[4];

    create_dl_translation_matrix(MENU_MTX_NOPUSH, dialog->leftOffset, dialog->width, 0);

    switch (gDialogBoxType) {
        case DIALOG_TYPE_ROTATE: // Renders a dialog black box with zoom and rotation
            if (gMenuState == MENU_STATE_DIALOG_OPENING || gMenuState == MENU_STATE_DIALOG_CLOSING) {
                create_dl_scale_matrix(MENU_MTX_NOPUSH, 1.0 / gDialogBoxScale, 1.0 / gDialogBoxScale,
                                       1.0f);
                // convert the speed into angle
                create_dl_rotation_matrix(MENU_MTX_NOPUSH, gDialogBoxAngle * 4.0f, 0, 0, 1.0f);
            }
            gDPSetEnvColor(gDisplayListHead++, 0, 0, 0, 150);
            break;
        case DIALOG_TYPE_ZOOM: // Renders a dialog white box with zoom
            if (gMenuState == MENU_STATE_DIALOG_OPENING || gMenuState == MENU_STATE_DIALOG_CLOSING) {
                create_dl_translation_matrix(MENU_MTX_NOPUSH, 65.0 - (65.0 / gDialogBoxScale),
                                             (40.0 / gDialogBoxScale) - 40, 0);
                create_dl_scale_matrix(MENU_MTX_NOPUSH, 1.0 / gDialogBoxScale, 1.0 / gDialogBoxScale,
                                       1.0f);
            }
            gDPSetEnvColor(gDisplayListHead++, 255, 255, 255, 150);
            break;
    }

    create_dl_translation_matrix(MENU_MTX_PUSH, X_VAL1, Y_VAL1, 0);
    create_dl_scale_matrix(MENU_MTX_NOPUSH, 1.1f, ((f32) linesPerBox / Y_VAL2) + 0.1, 1.0f);

    gSPDisplayList(gDisplayListHead++, dl_draw_text_bg_box);
    gSPPopMatrix(gDisplayListHead++, G_MTX_MODELVIEW);
}
