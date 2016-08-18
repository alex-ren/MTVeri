package org.ats_lang.postiats.mtv.simpletypes;
// todo import org.ats_lang.postiats.mtv.csharptype.ICSTypeBooking;
// todo import org.ats_lang.postiats.mtv.simpletypes.AuxSType.ToCSTypeResult;

import java.util.Map;
import java.util.Set;

// todo import org.stringtemplate.v4.ST;
// todo import org.stringtemplate.v4.STGroup;

/*
 * SType: Simple Type
 */
public interface ISType {
    
    public boolean equals(Object right);
    
    /* ************ *********** */
    
    // This operation may change the content of the object.
    public ISType normalize();  // Can be VarType
    
    // This operation cannot change the content of the object.
    // todo public ISType instantiate(Map<PolyParaType, ISType> map);
    
    // todo public TypeCheckResult match(ISType ty);
    
    /* ************ *********** */
    
    // create a new type without any proof
    // used in creating dynexp3
    public ISType removeProof();
    
    // For print at layer of dynexp3
    // todo public ST toSTStfpl3(STGroup stg);

    /* ************ *********** */
    
    // todo public ToCSTypeResult toCSType(Set<ICSTypeBooking> track);

}


