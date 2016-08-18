package org.ats_lang.postiats.mtv.level2parser.dynamics;


public class LABP2ATomit implements Ilabp2at {
    public LABP2ATomit() {}

    @Override
    public void normalizeType() { 
    }

	@Override
    public boolean isProof() {
	    throw new Error("Not supported.");
    }

	@Override
    public boolean isVoid() {
		throw new Error("Not supported.");
    }

}
