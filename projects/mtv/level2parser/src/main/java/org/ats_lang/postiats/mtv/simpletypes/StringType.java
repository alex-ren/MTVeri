package org.ats_lang.postiats.mtv.simpletypes;

import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.CSStringType;
import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.ICSTypeBooking;
import org.ats_lang.postiats.mtv.simpletypes.AuxSType.ToCSTypeResult;

import java.util.Set;

import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;

public class StringType extends EleType {
    public static StringType cInstance = new StringType();
    private StringType() {
        
    }
    
    @Override
    public ToCSTypeResult toCSType(Set<ICSTypeBooking> track) {
        return new ToCSTypeResult(CSStringType.c_instance, null);
    }

    @Override
    public ST toSTStfpl3(STGroup stg) {
        // StringType_st() ::= <<
        ST st = stg.getInstanceOf("StringType_st");
        return st;
    }
    
}
