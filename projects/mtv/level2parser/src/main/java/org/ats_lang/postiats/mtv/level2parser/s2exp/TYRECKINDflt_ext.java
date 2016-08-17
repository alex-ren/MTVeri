package org.ats_lang.postiats.mtv.level2parser.s2exp;

public class TYRECKINDflt_ext implements Ityreckind {
    public String m_name;
    
    public TYRECKINDflt_ext(String name) {
        m_name = name;
    }

    @Override
    public int getId() {
        return 0;  // 0: flat, 1: boxed
    }
}
