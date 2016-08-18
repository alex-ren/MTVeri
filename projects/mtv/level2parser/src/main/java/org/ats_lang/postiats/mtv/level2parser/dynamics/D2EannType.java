package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.statics.Cs2exp;
import org.ats_lang.postiats.mtv.simpletypes.ISType;

public class D2EannType implements Id2exp_node {

    public Cd2exp m_d2exp;
    public Cs2exp m_s2exp;
    
    private ISType m_stype;
    
    public void updateType(ISType ty) {
        m_stype = ty;
    }
    
    public D2EannType(Cd2exp d2exp, Cs2exp s2exp) {
        m_d2exp = d2exp;
        m_s2exp = s2exp;
    }

    @Override
    public ISType getSType() {
        if (null == m_stype) {
            throw new Error("check this");
        } else {
            return m_stype;
        }
    }
    
    @Override
    public void normalizeType() {
        m_stype = m_stype.normalize();
    }
    

}
