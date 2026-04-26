#include "basicheader.h"
#include "game/moving_texture.h"

extern u8 bbh_movtex_merry_go_round_water_entrance[];
extern u8 bbh_movtex_merry_go_round_water_side[];
extern u8 ccm_movtex_penguin_puddle_water[];
extern u8 inside_castle_movtex_green_room_water[];
extern u8 inside_castle_movtex_moat_water[];
extern u8 hmc_movtex_dorrie_pool_water[];
extern u8 hmc_movtex_toxic_maze_mist[];
extern u8 ssl_movtex_puddle_water[];
extern u8 ssl_movtex_toxbox_quicksand_mist[];
extern u8 sl_movtex_water[];
extern u8 wdw_movtex_area1_water[];
extern u8 wdw_movtex_area2_water[];
extern u8 jrb_movtex_water[];
extern u8 jrb_movtex_initial_mist[];
extern u8 jrb_movtex_sunken_ship_water[];
extern u8 thi_movtex_area1_water[];
extern u8 thi_movtex_area2_water[];
extern u8 castle_grounds_movtex_water[];
extern u8 lll_movtex_volcano_floor_lava[];
extern u8 ddd_movtex_area1_water[];
extern u8 ddd_movtex_area2_water[];
extern u8 wf_movtex_water[];
extern u8 castle_courtyard_movtex_star_statue_water[];
extern u8 ttm_movtex_puddle[];

extern u8 castle_movtex_water[];

extern void *rm_stub3000(u32 id);

/**
 * Find the quadCollection for a given quad collection id.
 */
void *gigaleak_cattle_get_quad_collection_from_id(u32 id) {
    if (id == CASTLE_MOVTEX_WATER) {
	return castle_movtex_water;
    }
    rm_stub3000(id);
}
