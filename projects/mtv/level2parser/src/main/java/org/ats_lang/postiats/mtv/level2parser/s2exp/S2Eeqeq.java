package org.ats_lang.postiats.mtv.level2parser.s2exp;


public class S2Eeqeq implements Is2exp_node {
    public Cs2exp m_left;
    public Cs2exp m_right;
    
    public S2Eeqeq(Cs2exp left, Cs2exp right) {
        m_left = left;
        m_right = right;
    }

}
