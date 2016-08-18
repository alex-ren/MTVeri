package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.simpletypes.PropType;
import org.ats_lang.postiats.mtv.simpletypes.VoidType;


public class P2Tvar implements Ip2at_node {
    public Cd2var m_var;
    
    public P2Tvar(Cd2var var) {
        m_var = var;
    }

    @Override
    public void normalizeType() {
        m_var.normalizeType();
    }

	@Override
    public boolean isProof() {
	    return (m_var.getSType() instanceof PropType);
    }

	@Override
    public boolean isVoid() {
		return (m_var.getSType() instanceof VoidType);
    }
}
