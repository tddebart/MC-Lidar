package color

import utils.blocktags as bt
import random as random

blocktag wood {
    #minecraft:logs,
    #minecraft:planks,
    #wooden_buttons,
    #wooden_doors,
    #wooden_fences,
    #wooden_pressure_plates,
    #wooden_slabs,
    #wooden_stairs,
    #wooden_trapdoors
}

blocktag dirt {
    #minecraft:dirt
}

blocktag sand {
    #minecraft:sand
}

blocktag red {
    minecraft:red_wool,
    minecraft:red_carpet,
    minecraft:red_terracotta,
    minecraft:red_glazed_terracotta,
    minecraft:red_concrete,
    minecraft:red_concrete_powder,
    minecraft:red_stained_glass,
    minecraft:red_stained_glass_pane,
    minecraft:red_shulker_box,
    minecraft:red_bed,
    minecraft:red_candle,

    minecraft:redstone_block,
    minecraft:repeater,
    minecraft:comparator,
    #minecraft:infiniburn_nether
}

blocktag green {
    minecraft:green_wool,
    minecraft:green_carpet,
    minecraft:green_terracotta,
    minecraft:green_glazed_terracotta,
    minecraft:green_concrete,
    minecraft:green_concrete_powder,
    minecraft:green_stained_glass,
    minecraft:green_stained_glass_pane,
    minecraft:green_shulker_box,
    minecraft:green_bed,
    minecraft:green_candle,

    minecraft:slime_block,
    #minecraft:leaves
}

blocktag blue {
    minecraft:blue_wool,
    minecraft:blue_carpet,
    minecraft:blue_terracotta,
    minecraft:blue_glazed_terracotta,
    minecraft:blue_concrete,
    minecraft:blue_concrete_powder,
    minecraft:blue_stained_glass,
    minecraft:blue_stained_glass_pane,
    minecraft:blue_shulker_box,
    minecraft:blue_bed,
    minecraft:blue_candle
}

blocktag orange {
    minecraft:orange_wool,
    minecraft:orange_carpet,
    minecraft:orange_terracotta,
    minecraft:orange_glazed_terracotta,
    minecraft:orange_concrete,
    minecraft:orange_concrete_powder,
    minecraft:orange_stained_glass,
    minecraft:orange_stained_glass_pane,
    minecraft:orange_shulker_box,
    minecraft:orange_bed,
    minecraft:orange_candle

}

blocktag yellow {
    minecraft:yellow_wool,
    minecraft:yellow_carpet,
    minecraft:yellow_terracotta,
    minecraft:yellow_glazed_terracotta,
    minecraft:yellow_concrete,
    minecraft:yellow_concrete_powder,
    minecraft:yellow_stained_glass,
    minecraft:yellow_stained_glass_pane,
    minecraft:yellow_shulker_box,
    minecraft:yellow_bed,
    minecraft:yellow_candle

}

blocktag gray {
    minecraft:gray_wool,
    minecraft:gray_carpet,
    minecraft:gray_terracotta,
    minecraft:gray_glazed_terracotta,
    minecraft:gray_concrete,
    minecraft:gray_concrete_powder,
    minecraft:gray_stained_glass,
    minecraft:gray_stained_glass_pane,
    minecraft:gray_shulker_box,
    minecraft:gray_bed,
    minecraft:gray_candle,

    #minecraft:base_stone_overworld,
    minecraft:gravel,
    #minecraft:stone_bricks
}


string getColor() {
    at (~ ~ ~) {
        if (block(#wood)) {
            return "#b57609"
        }
        if (block(#dirt)) {
            return "#5b8731"
        }

        if (block(#red)) {
            return "#a12722"
        }
        if (block(#green)) {
            return "#546d1b"
        }
        if (block(#blue)) {
            return "#35399d"
        }
        if (block(#orange)) {
            return "#f07613"
        }
        if (block(#yellow)) {
            return "#f8c627"
        }
        if (block(#gray)) {
            return "#8e8e86"
        }

        if (block(minecraft:coal_ore)) {
            if (random.range(0,2) == 0) {
                return "#242424"
            } else {
                return "#8e8e86"
            }
        }
        if (block(#sand)) {
            return "#e0d8ae"
        }
    }

    return "#e9ecec"
}