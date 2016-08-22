package org.ats_lang.postiats.mtv.levelcsharp.csharptypes;


import org.ats_lang.postiats.mtv.level2parser.Ilabel;

import java.util.List;

public class CSTBookingRecord implements ICSTypeBooking {
    public ICSTypeName m_name;
    public List<Ilabel> m_labs;
    
    public CSTBookingRecord(ICSTypeName name, List<Ilabel> labs) {
        m_name = name;
        m_labs = labs;
    }

}


