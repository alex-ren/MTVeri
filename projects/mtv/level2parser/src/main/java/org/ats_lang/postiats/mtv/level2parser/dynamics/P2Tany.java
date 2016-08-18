package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.simpletypes.ISType;
import org.ats_lang.postiats.mtv.simpletypes.PropType;
import org.ats_lang.postiats.mtv.simpletypes.VoidType;


public class P2Tany implements Ip2at_node {
    private ISType m_stype;
    
    public P2Tany() {
        m_stype = null;
    
    }
    
    public void updateSType(ISType type) {
        m_stype = type;
    }
    
    public ISType getSType() {
        if (null == m_stype) {
            throw new Error("Check this.");
        } else {
            return m_stype;
        }
    }

    @Override
    public void normalizeType() {
        m_stype = m_stype.normalize();
    }

	@Override
    public boolean isProof() {
	    return (m_stype instanceof PropType);
    }

	@Override
    public boolean isVoid() {
		return (m_stype instanceof VoidType);
    }
}


