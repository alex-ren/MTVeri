package org.ats_lang.postiats.mtv.utils;

/**
 * Created by alex on 8/28/16.
 */
public class IntValueHolder {
    private int m_v;

    public IntValueHolder(int v) {
        m_v = v;
    }

    public void update (int v) {
        if (v > m_v) {
            m_v = v;
        }
    }

    public int get() {
        return m_v;
    }
}
