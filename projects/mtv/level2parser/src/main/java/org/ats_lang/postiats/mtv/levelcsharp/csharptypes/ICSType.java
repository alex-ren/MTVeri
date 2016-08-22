package org.ats_lang.postiats.mtv.levelcsharp.csharptypes;

import org.stringtemplate.v4.ST;
import org.stringtemplate.v4.STGroup;

public interface ICSType {
    
    public ST toSt(STGroup stg, int level);

}
