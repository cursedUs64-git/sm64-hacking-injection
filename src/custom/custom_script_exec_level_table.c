#include "basicheader.h"
#include "segment_symbols.h"

#define STUB_LEVEL(_0, _1, _2, _3, _4, _5, _6, _7, _8)
#define DEFINE_LEVEL(_0, _1, _2, folder, _4, _5, _6, _7, _8, _9, _10)                                  \
    extern const LevelScript script_exec_##folder[]; 						       \
    extern const LevelScript level_##folder##_entry[];

#include "levels/level_defines.h"

#undef STUB_LEVEL
#undef DEFINE_LEVEL

const LevelScript script_exec_castle[] = {
    EXECUTE(0x0E, _castleSegmentRomStart, _castleSegmentRomEnd, level_castle_entry),
    RETURN(),
};

const LevelScript script_exec_donjon[] = {
    EXECUTE(0x0E, _donjonSegmentRomStart, _donjonSegmentRomEnd, level_donjon_entry),
    RETURN(),
};

const LevelScript script_exec_athletic[] = {
    EXECUTE(0x0E, _athleticSegmentRomStart, _athleticSegmentRomEnd, level_athletic_entry),
    RETURN(),
};

#define STUB_LEVEL(_0, _1, _2, _3, _4, _5, _6, _7, _8)
#define DEFINE_LEVEL(_0, levelenum, _2, folder, _4, _5, _6, _7, _8, _9, _10)                           \
    JUMP_IF(OP_EQ, levelenum, script_exec_##folder),

const LevelScript cahstom_script_exec_level_table[] = {
    GET_OR_SET(/*op*/ OP_GET, /*var*/ VAR_CURR_LEVEL_NUM),
#include "levels/level_defines.h"
    EXIT(),
};
#undef DEFINE_LEVEL
#undef STUB_LEVEL
