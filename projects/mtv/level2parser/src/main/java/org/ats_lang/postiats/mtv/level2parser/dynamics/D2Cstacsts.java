package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.level2parser.statics.Cs2cst;

import java.util.List;

/*
 * Define constant in statics.
 * Used for abstype, ...
 */
public class D2Cstacsts implements Id2ecl_node {
    public List<Cs2cst> m_s2csts;
    
    public D2Cstacsts(List<Cs2cst> s2csts) {
        m_s2csts = s2csts;
    }

}
