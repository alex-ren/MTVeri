package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.level2parser.Cloc_t;

public class Cd2exp {
    public Cloc_t d2exp_loc;
    public Id2exp_node d2exp_node;
    
    public Cd2exp (Cloc_t loc, Id2exp_node node) {
        d2exp_loc = loc;
        d2exp_node = node;
    }

    public Cd2exp() {
        // used by gson
    }
}


