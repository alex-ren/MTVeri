package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.simpletypes.ISType;


public class D2Eexp implements Id2exp_node {
    public Cd2exp m_d2exp;
    
    public D2Eexp(Cd2exp d2exp) {
        m_d2exp = d2exp;
    }

    @Override
    public ISType getSType() {
        return m_d2exp.d2exp_node.getSType();
    }
    
    @Override
    public void normalizeType() {
        throw new Error("check this");
    }

}