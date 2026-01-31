#include "basicheader.h"

// Take in the labels from armips using externs.
extern u8 SEC_CUSTOM_RAM[];
extern u8 SEC_CUSTOM_ROM[];
extern u8 SEC_CUSTOM_SIZE[];

void dma_read(u8 *dest, u8 *srcStart, u8 *srcEnd);

void cahstom_loads(void) {
    dma_read(/* dest */ SEC_CUSTOM_RAM, /* srcStart */ SEC_CUSTOM_ROM, /* srcEnd */ (u8 *)((u32)SEC_CUSTOM_ROM + (u32)SEC_CUSTOM_SIZE)); // Pointer casting to make the "arrays" able to operate arithmetically
}
