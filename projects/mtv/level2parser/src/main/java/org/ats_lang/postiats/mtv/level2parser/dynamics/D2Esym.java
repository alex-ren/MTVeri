package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.simpletypes.ISType;


public class D2Esym implements Id2exp_node {
    // Some example, "+", "-", "*", ">", and etc.
    public Cd2sym m_d2sym;
    
    public D2Esym(Cd2sym d2sym) {
        m_d2sym = d2sym;
    }

    @Override
    public ISType getSType() {
        return m_d2sym.getSType();
    }

    @Override
    public void normalizeType() {
        throw new Error("check this");
    }

}