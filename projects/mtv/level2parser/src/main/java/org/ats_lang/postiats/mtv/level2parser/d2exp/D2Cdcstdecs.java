package org.ats_lang.postiats.mtv.level2parser.d2exp;


import java.util.List;

// function declaration, value declaration
public class D2Cdcstdecs implements Id2ecl_node {
    public int m_knd;
    public Edcstkind m_dck;
    public List<Cd2cst> m_d2cst;
    
    public D2Cdcstdecs(int knd, Edcstkind dck, List<Cd2cst> d2cst) {
        m_knd = knd;
        m_dck = dck;
        m_d2cst = d2cst;
    }
}
