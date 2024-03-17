package raycast

import mc.java.nbt as nbt
import cmd.tag as tag
import utils.blocktags as bt

[name="mrcd_x0"]const scoreboard int x0
[name="mrcd_y0"]const scoreboard int y0
[name="mrcd_z0"]const scoreboard int z0
[name="mrcd_system"]const scoreboard int system

def send() {
    /kill 9d09b143-af14-4b1d-9e62-7bf15d0a45a3
    // Summon the ray where it would end after a ray_tick (0.5 blocks)
    // UUID: 9d09b143-af14-4b1d-9e62-7bf15d0a45a3
    /execute at @s anchored eyes run summon area_effect_cloud ^ ^ ^25 {Tags:["test_mark","init","mrcd_bullet","instnat"], UUID:[I;-1660309181,-1357624547,-1637712911,1560954275]}

    lazy entity mark = @e[type=area_effect_cloud,tag=init,limit=1]

    as (mark) {
        // We save the end coords of the motion vector in mblocks
        nbt.getNBT(x0, "Pos[0]", 1000)
        nbt.getNBT(y0, "Pos[1]", 1000)
        nbt.getNBT(z0, "Pos[2]", 1000)

        // We tp to the starting position (and placed it on the player eyes)
        /execute as @p at @p anchored eyes run tp 9d09b143-af14-4b1d-9e62-7bf15d0a45a3 ^ ^ ^ ~ ~

        // We save the start coords of the motion vector position in mblocks
        /execute store result score #var0 mrcd_system run data get entity @s Pos[0] 1000
        /execute store result score #var1 mrcd_system run data get entity @s Pos[1] 1000
        /execute store result score #var2 mrcd_system run data get entity @s Pos[2] 1000

        // We calculate the motion vector (end - start)
        /scoreboard players operation @s mrcd_x0 -= #var0 mrcd_system
        /scoreboard players operation @s mrcd_y0 -= #var1 mrcd_system
        /scoreboard players operation @s mrcd_z0 -= #var2 mrcd_system

        // Kill previous existing hit
        /kill @s[tag=mrcd_touch_edge]

        // Run raycast
        at (@s) {
            /function mrcd:ray_tick
        }
        /tag 9d09b143-af14-4b1d-9e62-7bf15d0a45a3 remove mrcd_tick_done
    }

    lazy entity hit = @e[type=!minecraft:text_display,tag=mrcd_touch_edge]

    as (hit) at (@s) {
        string clr = color.getColor()
        at(^ ^ ^-0.001) {
            if (@s[tag=mrcd_touch_y_plus]) {
                summon(0, 0.2, 0, -90, clr)
                summon(0, 0.2, 0, 90, clr)
            }
            if (@s[tag=mrcd_touch_y_minus]) {
                summon(0, -0.2, 0, 90, clr)
                summon(0, -0.2, 0, -90, clr)
            }
            if (@s[tag=mrcd_touch_z_plus]) {
                summon(-0.18, 0, 0, 0, clr)
                summon(-0.18, 0, 180, 0, clr)
            }
            if (@s[tag=mrcd_touch_z_minus]) {
                summon(-0.18, 0, 180, 0, clr)
                summon(-0.18, 0, 0, 0, clr)
            }
            if (@s[tag=mrcd_touch_x_plus]) {
                summon(-0.18, 0, -90, 0, clr)
                summon(-0.18, 0, 90, 0, clr)
            }
            if (@s[tag=mrcd_touch_x_minus]) {
                summon(-0.18, 0, 90,0, clr)
                summon(-0.18, 0, -90,0, clr)
            }
        }
    }

    /kill 9d09b143-af14-4b1d-9e62-7bf15d0a45a3
}

macro void summon(float yOffset, float zOffset, int rotX, int rotY, string color) {
    /summon text_display ~ ~$(yOffset) ~$(zOffset) {Tags: ["text_marker"], Rotation:[$(rotX)F, $(rotY)F],text:'{"text":"⚫","color":"$(color)"}',background:0, width:0.1f, height:0.1f}
}