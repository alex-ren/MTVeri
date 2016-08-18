package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.simpletypes.ISType;


public class D2Eignored implements Id2exp_node {
    static public final D2Eignored cInstance = new D2Eignored();
    
    private D2Eignored() {
        
    }

    @Override
    public ISType getSType() {
        throw new Error("should not happen");
    }
    
    @Override
    public void normalizeType() {
        throw new Error("check this");
    }

}
