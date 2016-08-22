package org.ats_lang.postiats.mtv.simpletypes;

import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.CSCharType;
import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.ICSTypeBooking;
import org.ats_lang.postiats.mtv.simpletypes.AuxSType.ToCSTypeResult;

import java.util.Set;

import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;

public class CharType extends EleType {
    public static CharType cInstance = new CharType();
    private CharType() {
        
    }

    @Override
    public ToCSTypeResult toCSType(Set<ICSTypeBooking> track) {
        return new ToCSTypeResult(CSCharType.c_instance, null);
    }
    
    @Override
    public ST toSTStfpl3(STGroup stg) {
        // CharType_st() ::= <<
        ST st = stg.getInstanceOf("CharType_st");
        return st;
    }
}
