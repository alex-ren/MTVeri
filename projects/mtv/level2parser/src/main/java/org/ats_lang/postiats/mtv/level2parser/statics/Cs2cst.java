package org.ats_lang.postiats.mtv.level2parser.statics;

import org.ats_lang.postiats.mtv.level2parser.Cstamp;
import org.ats_lang.postiats.mtv.level2parser.Csymbol;

import java.util.List;


/*
 * abstype will introduce Cs2cst
 */
public class Cs2cst {
    public Cstamp m_stamp;
    public Csymbol m_symbol;
    
    public Is2rt m_srt;
    public List<Cstamp> m_dconlst;
    
    // todo 
    // s2cst_supcls
    
    public Cstamp getStamp() {
        return m_stamp;
    }
    
    public Csymbol getSymbol() {
        return m_symbol;
    }
    
    public Cs2cst(Cstamp stamp, Csymbol symbol, Is2rt srt, List<Cstamp> dconlst) {
        m_stamp = stamp;
        m_symbol = symbol;
        m_srt = srt;
        m_dconlst = dconlst;
    }
    
    public String toStringWithStamp() {
        return m_symbol.toString() + m_stamp.getData();
    }
    
    public String toStringNoStamp() {
        return m_symbol.toString();
    }
    
}
