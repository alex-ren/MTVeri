package org.ats_lang.postiats.mtv.level2parser.d2exp;


import java.util.List;

/*
 * Multiple function definition.
 */
public class D2Cfundecs implements Id2ecl_node {
    public Efunkind m_knd;
    public List<Cf2undec> m_f2ds;
    
    public D2Cfundecs(Efunkind knd, List<Cf2undec> f2ds) {
        m_knd = knd;
        m_f2ds = f2ds;
    }

}

