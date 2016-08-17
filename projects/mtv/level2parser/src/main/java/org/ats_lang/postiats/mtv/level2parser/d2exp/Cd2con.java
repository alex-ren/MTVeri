package org.ats_lang.postiats.mtv.level2parser.d2exp;

import org.ats_lang.postiats.mtv.level2parser.Cstamp;
import org.ats_lang.postiats.mtv.level2parser.Csymbol;
import org.ats_lang.postiats.mtv.level2parser.s2exp.Cs2exp;

/*
 * constructor for datatype
 */
public class Cd2con {
    public Cstamp m_stamp;
	public Cs2exp m_type;  // Caution: this can be null
	public Csymbol m_sym;
	

	public Cd2con(Cstamp stamp, Cs2exp type, Csymbol sym) {
            m_sym = sym;
            m_type = type;
            m_stamp = stamp;
        }

}


