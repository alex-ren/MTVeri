package org.ats_lang.postiats.mtv.level2parser.statics;

import org.ats_lang.postiats.mtv.simpletypes.ESort;

import java.util.List;

public class S2RTfun implements Is2rt {
    public List<Is2rt> m_args;
    public Is2rt m_res;

    public S2RTfun(List<Is2rt> args, Is2rt res) {
        m_args = args;
        m_res = res;
    }

    @Override
    public ESort simplify() {
        return ESort.advance;
    }

    @Override
    public boolean isType() {
        return false;
    }


}