package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.level2parser.Cstamp;
import org.ats_lang.postiats.mtv.level2parser.Csymbol;
import org.ats_lang.postiats.mtv.simpletypes.ISType;
import org.ats_lang.postiats.mtv.simpletypes.VarType;

public class Cd2var {
    public Csymbol m_sym;
    public Cstamp m_stamp;
    
    private ISType m_stype;
    
    public Cstamp getStamp() {
        return m_stamp;
    }
    
    public Csymbol getSymbol() {
        return m_sym;
    }
    
    public Cd2var(Csymbol sym, Cstamp stamp) {
        m_sym = sym;
        m_stamp = stamp;
        
        m_stype = null;
    }
    
    public void updateSType(ISType stype) {
//    	System.out.println("+++++++++++++++++++ updateSType for " + m_sym + " addr is " + this);
        if (null != m_stype) {
            m_stype.match(stype);
        } else {
            m_stype = stype;
        }
    }
    
    public void normalizeType() {
        m_stype = m_stype.normalize();
        
        if (m_stype instanceof VarType) {
            throw new Error("Cannot figure out the type for " + m_sym);
        }
    }
    
    public ISType getSType() {
        return m_stype;
    }
    
    @Override
    public String toString() {
        return m_sym.toString() + m_stamp.getData();
    }

}