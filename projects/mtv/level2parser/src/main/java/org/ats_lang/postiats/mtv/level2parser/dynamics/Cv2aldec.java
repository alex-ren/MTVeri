package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.level2parser.Cloc_t;

public class Cv2aldec {
    public Cloc_t v2aldec_loc;
    public Cp2at v2aldec_pat;
    public Cd2exp v2aldec_def;
    
    public Cv2aldec(Cloc_t loc, Cp2at pat, Cd2exp def) {
        v2aldec_loc = loc;
        v2aldec_pat = pat;
        v2aldec_def = def;
    }
    
    public Cv2aldec() {
        // used by gson
    }

}
