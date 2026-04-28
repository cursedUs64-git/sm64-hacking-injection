#include "basicheader.h"

extern const Vtx vertex_ia8_char[];

// 0x0200EEA8 - 0x0200EEF0
const Gfx jp_dl_ia_text_tex_settings[] = {
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b, 0, 0, G_TX_LOADTILE, 0, G_TX_CLAMP, 4, G_TX_NOLOD, G_TX_CLAMP,
                3, G_TX_NOLOD),
    gsDPLoadSync(),
    gsDPLoadBlock(G_TX_LOADTILE, 0, 0, 8 * 16 - 1, CALC_DXT(8, G_IM_SIZ_8b_BYTES)),
    gsDPSetTile(G_IM_FMT_IA, G_IM_SIZ_8b, 1, 0, G_TX_RENDERTILE, 0, G_TX_CLAMP, 4, G_TX_NOLOD,
                G_TX_CLAMP, 3, G_TX_NOLOD),
    gsDPSetTileSize(0, 0, 0, (8 - 1) << G_TEXTURE_IMAGE_FRAC, (16 - 1) << G_TEXTURE_IMAGE_FRAC),
    gsSPVertex(vertex_ia8_char, 4, 0),
    gsSP2Triangles(0, 1, 2, 0x0, 0, 2, 3, 0x0),
    gsSPEndDisplayList(),
};
