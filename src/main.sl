package main

import utils.blocktags as bt
import utils.draw as draw
import cmd.particles as particles

[criterion="minecraft.used:minecraft.carrot_on_a_stick"] scoreboard int used
bool inited

def @load() {
    if (!inited) {
        reset()
        inited = true
    }
}

def @playertick(){
    //rc.shoot(10, 0.1, !block(#bt.air)){
        //particles.dust(1,0,0,1)
        //say trace
    //}

    //raycast.send()

    if (used >= 1) {
        cast()
        used = 0
    }
}
