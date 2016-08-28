package org.ats_lang.postiats.mtv.level2parser.dynamics;

import org.ats_lang.postiats.mtv.level2parser.statics.Cs2cst;

import java.util.List;

/*
 * Definition of datatype
 */
public class D2Cdatdecs implements Id2ecl_node {
    public int m_knd;
    public List<Cs2cst> m_s2csts;
    
    public D2Cdatdecs(int knd, List<Cs2cst> s2csts) {
        m_knd = knd;
        m_s2csts = s2csts;
    }

}