#include "basicheader.h"

#define STUB_LEVEL(textname, _1, _2, _3, _4, _5, _6, _7, _8) textname,
#define DEFINE_LEVEL(textname, _1, _2, _3, _4, _5, _6, _7, _8, _9, _10) textname,

char sLevelSelectStageNames[64][16] = {
#include "levels/level_defines.h"
};
#undef STUB_LEVEL
#undef DEFINE_LEVEL
