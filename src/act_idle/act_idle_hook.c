#include "basicheader.h"

extern s32 custom_act_idle(struct MarioState *m);

s32 act_idle(struct MarioState *m) {
    return custom_act_idle(m);
}
