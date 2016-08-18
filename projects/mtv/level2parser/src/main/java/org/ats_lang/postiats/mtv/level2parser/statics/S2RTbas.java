package org.ats_lang.postiats.mtv.level2parser.statics;

import org.ats_lang.postiats.mtv.level2parser.Csymbol;
import org.ats_lang.postiats.mtv.simpletypes.ESort;

public class S2RTbas implements Is2rt {

    public Csymbol m_sym;
    
    public S2RTbas(Csymbol sym) {
        m_sym = sym;
    }

    @Override
    public ESort simplify() {
        return ESort.fromString(m_sym.m_str);
    }
    
    @Override
    public String toString() {
        return m_sym.toString();
    }

    @Override
    public boolean isType() {
        switch (this.simplify())
        {
        case type:
        case t0ype:
        case vtype:
        case vt0ype:
            return true;
        default:
            return false;
        }
    }

}
