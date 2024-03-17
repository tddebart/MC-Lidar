

def cast() {
    /kill @e[tag=lidar.spawner]
    /kill @e[tag=lidar.looker]
    /kill @e[type=minecraft:text_display, limit=30, sort=random]

    // UUID: b693d05a-d372-444e-bbc4-7beca9f582c1
    /summon marker ~ ~ ~ {UUID:[I;-1231826854,-747486130,-1144751124,-1443527999],Tags:["lidar.spawner"]}
    entity spawner = @e[type=marker,tag=lidar.spawner]
    /execute at @s anchored eyes run tp @e[tag=lidar.spawner] ^ ^ ^ ~ ~


    // UUID: 427ad036-28a0-401c-b280-e9e8e5881430
    /summon marker ~ ~ ~ {UUID:[I;1115344950,681590812,-1300174360,-444066768],Tags:["lidar.looker"]}
    entity looker = @e[type=marker,tag=lidar.looker]
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
                // Make spawner look at looker
                /execute as b693d05a-d372-444e-bbc4-7beca9f582c1 at @s facing entity 427ad036-28a0-401c-b280-e9e8e5881430 eyes run tp @s ~ ~ ~ ~ ~
                // As spawner run raycast
                /execute as b693d05a-d372-444e-bbc4-7beca9f582c1 at @s run function lidar:raycast/send

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

    /kill @e[tag=lidar.spawner]
    /kill @e[tag=lidar.looker]
}