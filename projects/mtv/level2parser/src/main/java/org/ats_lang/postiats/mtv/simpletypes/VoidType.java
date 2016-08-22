package org.ats_lang.postiats.mtv.simpletypes;

import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.CSVoidType;
import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.ICSTypeBooking;
import org.ats_lang.postiats.mtv.simpletypes.AuxSType.ToCSTypeResult;

import java.util.Map;
import java.util.Set;

import org.ats_lang.postiats.mtv.utils.Log;
import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;

public class VoidType extends EleType {
    
    public VoidType() {
        
    }

    public static VoidType cInstance = new VoidType();

    
    @Override
    public VoidType normalize() {
        return this;
    }

    @Override
    public TypeCheckResult match(ISType ty) {
        ISType right0 = ty.normalize();
        
        if (right0 instanceof VarType) {
            ((VarType)right0).setType(this);
            return new TypeCheckResult();
        } else if (this == right0) {
            return new TypeCheckResult();
        } else {
            return new TypeCheckResult("Type mismatch: " + Log.getFilePos());
        }
    }

    @Override
    public ISType instantiate(Map<PolyParaType, ISType> map) {
        return this;
    }

    @Override
    public ToCSTypeResult toCSType(Set<ICSTypeBooking> track) {
        return new ToCSTypeResult(CSVoidType.c_instance, null);
    }

//    @Override
//    public NamifyResult namify(Map<ITypeName, NamedType> map, Set<PolyParaType> esc) {
//        NamifyResult ret = new NamifyResult(null, null, false);
//        return ret;
//    }
//
//    @Override
//    public boolean equalCSharp(ISType type, Map<PolyParaType, PolyParaType> env) {
//        return this == type;
//    }
    
    @Override
    public ST toSTStfpl3(STGroup stg) {
        // VoidType_st() ::= <<
        ST st = stg.getInstanceOf("VoidType_st");
        return st;
    }

}
