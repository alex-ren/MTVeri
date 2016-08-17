package org.ats_lang.postiats.mtv.level2parser.d2exp;

import java.util.List;

public class D2Clist implements Id2ecl_node {
    public List<Cd2ecl> m_d2cs;
    
    public D2Clist(List<Cd2ecl> d2cs) {
        m_d2cs = d2cs;
    }

}
