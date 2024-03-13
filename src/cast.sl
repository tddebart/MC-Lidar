import cmd.entity as ent
import cmd.java.data as data
import mc.pointer as pointer
import cmd.tp as tp
import mc.java.nbt as nbt

def cast() {
    /kill @e[tag=lidar.spawner]
    /kill @e[tag=lidar.looker]
    /kill @e[type=minecraft:text_display, limit=30, sort=random]

    [tag="lidar.spawner"]entity spawner = pointer.newPointer()
    /execute at @s anchored eyes run tp @e[tag=lidar.spawner] ^ ^ ^ ~ ~

    [tag="lidar.looker"]entity looker = pointer.newPointer()
    /execute at @s anchored eyes run tp @e[tag=lidar.looker] ^ ^ ^2 ~ ~

    // Rotate looker to our rotation
    //data modify entity @e[tag=lidar.looker, limit=1] Rotation set from entity @s Rotation

    for (int i = 0; i < moveHorizontal/2; i++) {
        as(looker) at (@s) {
            /tp @s ^0.25 ^ ^
        }
    }

    for (int i = 0; i < moveVertical; i++) {
        as(looker) at (@s) {
            /tp @s ^ ^-0.138 ^
        }
    }

    as (looker) at (@s) {
        for (int y = 0; y <= moveVertical; y++) {
            for (int x = 0; x < moveHorizontal; x++) {
                as (spawner) at (@s) {
                    // Make spawner look at looker
                    facing (looker) {
                        /tp @s ~ ~ ~ ~ ~
                    }

                    raycast.send()
                }

                // Tp looker one column right
                at (@s) {
                    /tp @s ^-0.25 ^ ^
                }
            }

            // Tp one row up
            at (@s) {
                /tp @s ^ ^0.3 ^
            }

            // Move back to start
            for (int x = 0; x < moveHorizontal; x++) {
                // Tp one column left
                at (@s) {
                    /tp @s ^0.25 ^ ^
                }
            }
        }
    }
}