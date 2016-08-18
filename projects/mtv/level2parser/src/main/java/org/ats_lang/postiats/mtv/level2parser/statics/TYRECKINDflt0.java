package org.ats_lang.postiats.mtv.level2parser.statics;

public class TYRECKINDflt0 implements Ityreckind {
    static public TYRECKINDflt0 cInstance = new TYRECKINDflt0();
    
    private TYRECKINDflt0() {
        
    }

    @Override
    public int getId() {
        return 0;  // 0: flat, 1: boxed
    }
}
