package org.ats_lang.postiats.mtv.level2parser.statics;

import org.ats_lang.postiats.mtv.level2parser.Ilabel;

public class Clabs2exp {
    public Ilabel m_label;
    public String m_name;
    public Cs2exp m_s2exp;
    
    public Clabs2exp(Ilabel label, String name, Cs2exp s2exp) {
        m_label = label;
        m_name = name;
        m_s2exp = s2exp;
    }

}