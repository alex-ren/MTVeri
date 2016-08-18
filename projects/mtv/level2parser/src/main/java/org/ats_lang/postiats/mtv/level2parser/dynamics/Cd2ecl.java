package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.level2parser.Cloc_t;

public class Cd2ecl {
    public Cloc_t d2ecl_loc;
    // todo
    // public Id2ecl_node d2ecl_node;
    
    public Cd2ecl(Cloc_t loc, Id2ecl_node node) {
        d2ecl_loc = loc;
        // todo
        // d2ecl_node = node;
    }
    
    public Cd2ecl() {
        // Used by gson.
    }

}
