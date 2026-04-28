#include "basicheader.h"

void jp_render_generic_char(u8 c)
{
    void **fontLUT = segmented_to_virtual(main_font_lut);
    void *packedTexture = segmented_to_virtual(fontLUT[c]);
    void *unpackedTexture = alloc_ia8_text_from_i1(packedTexture, 8, 16);

    gDPPipeSync(gDisplayListHead++);
    gDPSetTextureImage(gDisplayListHead++, G_IM_FMT_IA, G_IM_SIZ_8b, 1,
                       VIRTUAL_TO_PHYSICAL(unpackedTexture));
    gSPDisplayList(gDisplayListHead++, dl_ia_text_tex_settings);
}
