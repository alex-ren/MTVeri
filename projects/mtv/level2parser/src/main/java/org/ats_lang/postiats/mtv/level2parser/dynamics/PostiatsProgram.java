package org.ats_lang.postiats.mtv.level2parser.dynamics;


import org.ats_lang.postiats.mtv.level2parser.Cstamp;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2cst;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2var;

import java.util.List;
import java.util.Map;

public class PostiatsProgram {
    public List<Cd2ecl> m_d2ecs;
    public Map<Cstamp, Cs2cst> m_s2cstmap;
    public Map<Cstamp, Cs2var> m_s2varmap;
    public Map<Cstamp, Cd2con> m_d2conmap;
    public Map<Cstamp, Cd2cst> m_d2cstmap;
    public Map<Cstamp, Cd2var> m_d2varmap;
    public int m_maxStamp;

    public PostiatsProgram(List<Cd2ecl> d2ecs
            , Map<Cstamp, Cs2cst> s2cstmap
            , Map<Cstamp, Cs2var> s2varmap
            , Map<Cstamp, Cd2con> d2conmap
            , Map<Cstamp, Cd2cst> d2cstmap
            , Map<Cstamp, Cd2var> d2varmap
            , int maxStamp) {
        m_d2ecs = d2ecs;
        m_s2cstmap = s2cstmap;
        m_s2varmap = s2varmap;
        m_d2conmap = d2conmap;
        m_d2cstmap = d2cstmap;
        m_d2varmap = d2varmap;
        m_maxStamp = maxStamp;
    }

}
