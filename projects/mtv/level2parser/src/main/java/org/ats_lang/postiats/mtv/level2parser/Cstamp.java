package org.ats_lang.postiats.mtv.level2parser;

public class Cstamp {
    public int m_id;

    public int getData() {
        return m_id;
    }
    
    public Cstamp(int id) {
        m_id = id;
    }
    
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Cstamp))
            return false;
        Cstamp pn = (Cstamp) o;
        return (pn.m_id == m_id);
    }
    
    @Override 
    public int hashCode() {
        return m_id;
    }

}
