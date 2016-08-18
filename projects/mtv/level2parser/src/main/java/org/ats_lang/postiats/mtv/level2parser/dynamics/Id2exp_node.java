package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.simpletypes.ISType;

public interface Id2exp_node {
    public ISType getSType();
    
    public void normalizeType();
}
