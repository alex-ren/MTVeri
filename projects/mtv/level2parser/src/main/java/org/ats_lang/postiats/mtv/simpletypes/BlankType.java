package org.ats_lang.postiats.mtv.simpletypes;

import org.ats_lang.postiats.mtv.levelcsharp.csharptypes.ICSTypeBooking;
import org.ats_lang.postiats.mtv.simpletypes.AuxSType.ToCSTypeResult;

import java.util.Set;

import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;

/*
 * This type is used as a place holder in those scenarios in which
 * it's too difficult to specify types. If detailed type information
 * is needed, then I should specify the real type instead of using
 * this BlankType.
 */
public class BlankType extends EleType {
    public static BlankType cInstance = new BlankType();
    private BlankType() {
        
    }

    @Override
    public ToCSTypeResult toCSType(Set<ICSTypeBooking> track) {
        throw new Error("Should not happen.");
    }
    
    @Override
    public ST toSTStfpl3(STGroup stg) {
    	throw new Error("Should not happen.");
    }
}
