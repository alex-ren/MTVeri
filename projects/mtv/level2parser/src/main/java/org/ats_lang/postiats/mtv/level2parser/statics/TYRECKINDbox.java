package org.ats_lang.postiats.mtv.level2parser.statics;

public class TYRECKINDbox implements Ityreckind {
    static public TYRECKINDbox cInstance = new TYRECKINDbox();
    
    private TYRECKINDbox() {
        
    }

    @Override
    public int getId() {
        return 1;  // 0: flat, 1: boxed
    }
        
}