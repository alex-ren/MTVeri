package org.ats_lang.postiats.mtv.level2parser.dynamics;


public class P2Tignored implements Ip2at_node {
    public final static P2Tignored cInstance = new P2Tignored();
    
    private P2Tignored() {
        
    }

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