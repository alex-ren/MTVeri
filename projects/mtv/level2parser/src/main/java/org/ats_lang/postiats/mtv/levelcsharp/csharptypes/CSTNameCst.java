package org.ats_lang.postiats.mtv.levelcsharp.csharptypes;


import org.ats_lang.postiats.mtv.level2parser.Cstamp;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2cst;

import java.util.HashMap;
import java.util.Map;

public class CSTNameCst implements ICSTypeName {
    private Cs2cst m_cst;
    
    static private Map<Cstamp, CSTNameCst> s_map =
            new HashMap<Cstamp, CSTNameCst>();
    
    static public CSTNameCst fromCs2cst(Cs2cst cst) {
        CSTNameCst v = s_map.get(cst.m_stamp);
        if (null == v) {
            v = new CSTNameCst(cst);
            s_map.put(cst.m_stamp, v);
            return v;
        } else {
            return v;
        }
    }
    
    private CSTNameCst(Cs2cst cst) {
        m_cst = cst;
    }

    public String toStringCS() {
        return m_cst.toString();
        
    }

}
