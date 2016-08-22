package org.ats_lang.postiats.mtv.simpletypes;

import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.CSBoolType;
import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.ICSTypeBooking;
import org.ats_lang.postiats.mtv.simpletypes.AuxSType.ToCSTypeResult;

import java.util.Set;

import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;

public class BoolType extends EleType {
    public static BoolType cInstance = new BoolType();
    private BoolType() {
        
    }

    @Override
    public ToCSTypeResult toCSType(Set<ICSTypeBooking> track) {
        return new ToCSTypeResult(CSBoolType.c_instance, null);
    }

    @Override
    public ST toSTStfpl3(STGroup stg) {
        // BoolType_st() ::= <<
        ST st = stg.getInstanceOf("BoolType_st");
        return st;
    }
}
