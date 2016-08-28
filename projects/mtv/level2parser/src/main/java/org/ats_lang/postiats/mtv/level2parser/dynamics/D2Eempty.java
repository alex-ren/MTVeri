package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.simpletypes.ISType;


public class D2Eempty implements Id2exp_node {
	public static D2Eempty cInstance = new D2Eempty();
	
    private ISType m_ty;
    
	private D2Eempty() {
		
	}
	
    public void updateType(ISType ty) {
        m_ty = ty;
    }

    
    @Override
    public ISType getSType() {
        if (null == m_ty) {
            throw new Error("check this");
        } else {
            return m_ty;
        }
    }

    @Override
    public void normalizeType() {
        throw new Error("check this");
    }

}