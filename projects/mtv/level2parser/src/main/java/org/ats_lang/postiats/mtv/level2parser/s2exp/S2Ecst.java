package org.ats_lang.postiats.mtv.level2parser.s2exp;

public class S2Ecst implements Is2exp_node {
	public Cs2cst m_s2cst;
	
	public String getName() {
	    return m_s2cst.m_symbol.getData();
	}
	
	public S2Ecst(Cs2cst s2cst) {
		m_s2cst = s2cst;
	}
	
	public String toString() {
	    return m_s2cst.toString();
	}

}
