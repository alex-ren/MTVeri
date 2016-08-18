package org.ats_lang.postiats.mtv.level2parser.statics;

public interface Ifunclo {
    public boolean isClosure();
    
    public boolean match(Ifunclo right);
    
    @Override
    public String toString();

}
