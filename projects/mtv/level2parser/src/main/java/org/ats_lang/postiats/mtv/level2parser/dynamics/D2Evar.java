package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.simpletypes.ISType;


public class D2Evar implements Id2exp_node {
    public Cd2var m_d2var;

    public D2Evar(Cd2var d2var) {
        m_d2var = d2var;
    }

    @Override
    public ISType getSType() {
        return m_d2var.getSType();
    }

    @Override
    public void normalizeType() {
        m_d2var.normalizeType();
    }

}