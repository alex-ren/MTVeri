package org.ats_lang.postiats.mtv.level2parser;

import org.ats_lang.postiats.mtv.ccomp.DefaultLibraryTypes;
import org.ats_lang.postiats.mtv.level2parser.dynamics.*;
import org.ats_lang.postiats.mtv.level2parser.statics.Clabs2exp;
import org.ats_lang.postiats.mtv.level2parser.statics.Clabs2expDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2cst;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2cstDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2var;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2varDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.Ifunclo;
import org.ats_lang.postiats.mtv.level2parser.statics.IfuncloDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.Is2exp_node;
import org.ats_lang.postiats.mtv.level2parser.statics.Is2exp_nodeDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.Is2rt;
import org.ats_lang.postiats.mtv.level2parser.statics.Is2rtDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.Ityreckind;
import org.ats_lang.postiats.mtv.level2parser.statics.ItyreckindDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Eapp;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EappDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Ecst;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EcstDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Eeqeq;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EeqeqDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Eerr;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EerrDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Eexi;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EexiDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Eextkind;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EextkindDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Efun;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EfunDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Eignored;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EignoredDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Eint;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EintDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Eintinf;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EintinfDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Einvar;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EinvarDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Esizeof;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EsizeofDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Etyrec;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EtyrecDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Euni;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EuniDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2Evar;
import org.ats_lang.postiats.mtv.level2parser.statics.S2EvarDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2RTbas;
import org.ats_lang.postiats.mtv.level2parser.statics.S2RTbasDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2RTfun;
import org.ats_lang.postiats.mtv.level2parser.statics.S2RTfunDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.S2RTtup;
import org.ats_lang.postiats.mtv.level2parser.statics.S2RTtupDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDbox;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDboxDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDbox_lin;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDbox_linDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDflt0;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDflt0Deserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDflt1;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDflt1Deserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDflt_ext;
import org.ats_lang.postiats.mtv.level2parser.statics.TYRECKINDflt_extDeserializer;

import java.io.Reader;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.stream.JsonReader;
import org.ats_lang.postiats.mtv.level2parser.dynamics.PostiatsProgram;
import org.ats_lang.postiats.mtv.level2parser.dynamics.PostiatsProgramDeserializer;

public class PostiatsLevel2ParserJson {
    private Gson m_gson;
    
    public PostiatsLevel2ParserJson() {

        GsonBuilder gsonBuilder = new GsonBuilder();
        DefaultLibraryTypes type_fac = new DefaultLibraryTypes();
        
        /* *********** common *********** */
        
        gsonBuilder.registerTypeAdapter(Cloc_t.class, new Cloc_tDeserializer());
        gsonBuilder.registerTypeAdapter(Cstamp.class, new CstampDeserializer());
        gsonBuilder.registerTypeAdapter(Csymbol.class, new CsymbolDeserializer());
        
        gsonBuilder.registerTypeAdapter(Ilabel.class, new IlabelDeserializer());

        /* *********** dynamics *********** */

        Cd2cstDeserializer d2cstDeserializer = new Cd2cstDeserializer(type_fac);
        gsonBuilder.registerTypeAdapter(Cd2cst.class, d2cstDeserializer);

        Cd2varDeserializer d2varDeserializer = new Cd2varDeserializer();
        gsonBuilder.registerTypeAdapter(Cd2var.class, d2varDeserializer);

        Cd2conDeserializer d2conDeserializer = new Cd2conDeserializer();
        gsonBuilder.registerTypeAdapter(Cd2con.class, d2conDeserializer);

        gsonBuilder.registerTypeAdapter(Cd2sym.class, new Cd2symDeserializer(type_fac));


        gsonBuilder.registerTypeAdapter(Id2ecl_node.class, new Id2ecl_nodeDeserializer());

        gsonBuilder.registerTypeAdapter(D2Cfundecs.class, new D2CfundecsDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cignored.class, new D2CignoredDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cimpdec.class, new D2CimpdecDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cextcode.class, new D2CextcodeDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cvaldecs.class, new D2CvaldecsDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cdcstdecs.class, new D2CdcstdecsDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cstacsts.class, new D2CstacstsDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cdatdecs.class, new D2CdatdecsDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cinclude.class, new D2CincludeDeserializer());
        gsonBuilder.registerTypeAdapter(D2Clist.class, new D2ClistDeserializer());
        gsonBuilder.registerTypeAdapter(D2Clocal.class, new D2ClocalDeserializer());
        gsonBuilder.registerTypeAdapter(D2Cstaload.class, new D2CstaloadDeserializer());


        gsonBuilder.registerTypeAdapter(Id2exp_node.class, new Id2exp_nodeDeserializer());

        gsonBuilder.registerTypeAdapter(D2Eapplst.class, new D2EapplstDeserializer());
        gsonBuilder.registerTypeAdapter(D2Ecst.class, new D2EcstDeserializer());
        gsonBuilder.registerTypeAdapter(D2Ef0loat.class, new D2Ef0loatDeserializer());
        gsonBuilder.registerTypeAdapter(D2Ei0nt.class, new D2Ei0ntDeserializer());
        gsonBuilder.registerTypeAdapter(D2Eifopt.class, new D2EifoptDeserializer());
        gsonBuilder.registerTypeAdapter(D2ElamDyn.class, new D2ElamDynDeserializer());
        gsonBuilder.registerTypeAdapter(D2ElamSta.class, new D2ElamStaDeserializer());
        gsonBuilder.registerTypeAdapter(D2ElamMet.class, new D2ElamMetDeserializer());
        gsonBuilder.registerTypeAdapter(D2Elet.class, new D2EletDeserializer());
        gsonBuilder.registerTypeAdapter(D2Es0tring.class, new D2Es0tringDeserializer());
        gsonBuilder.registerTypeAdapter(D2Esym.class, new D2EsymDeserializer());
        gsonBuilder.registerTypeAdapter(D2Evar.class, new D2EvarDeserializer());
        gsonBuilder.registerTypeAdapter(D2EannType.class, new D2EannTypeDeserializer());
        gsonBuilder.registerTypeAdapter(D2EannSeff.class, new D2EannSeffDeserializer());
        gsonBuilder.registerTypeAdapter(D2EannFunclo.class, new D2EannFuncloDeserializer());
        gsonBuilder.registerTypeAdapter(D2Etup.class, new D2EtupDeserializer());
        gsonBuilder.registerTypeAdapter(D2Elist.class, new D2ElistDeserializer());
        gsonBuilder.registerTypeAdapter(D2Eignored.class, new D2EignoredDeserializer());

        gsonBuilder.registerTypeAdapter(Id2exparg.class, new Id2expargDeserializer());

        gsonBuilder.registerTypeAdapter(D2EXPARGdyn.class, new D2EXPARGdynDeserializer());
        gsonBuilder.registerTypeAdapter(D2EXPARGsta.class, new D2EXPARGstaDeserializer());


        gsonBuilder.registerTypeAdapter(Ip2at_node.class, new Ip2at_nodeDeserializer());

        gsonBuilder.registerTypeAdapter(P2Tany.class, new P2TanyDeserializer());
        gsonBuilder.registerTypeAdapter(P2Tempty.class, new P2TemptyDeserializer());
        gsonBuilder.registerTypeAdapter(P2Tignored.class, new P2TignoredDeserializer());
        gsonBuilder.registerTypeAdapter(P2Tpat.class, new P2TpatDeserializer());
        gsonBuilder.registerTypeAdapter(P2Tvar.class, new P2TvarDeserializer());
        gsonBuilder.registerTypeAdapter(P2Trec.class, new P2TrecDeserializer());
        gsonBuilder.registerTypeAdapter(P2Tann.class, new P2TannDeserializer());
        gsonBuilder.registerTypeAdapter(P2Tcon.class, new P2TconDeserializer());

 
        gsonBuilder.registerTypeAdapter(Efunkind.class, new EfunkindDeserializer());
        gsonBuilder.registerTypeAdapter(Evalkind.class, new EvalkindDeserializer());
        gsonBuilder.registerTypeAdapter(Edcstkind.class, new EdcstkindDeserializer());
        gsonBuilder.registerTypeAdapter(Epckind.class, new EpckindDeserializer());


        gsonBuilder.registerTypeAdapter(Ilabp2at.class, new Ilabp2atDeserializer());

        /* *********** statics *********** */

        Cs2cstDeserializer s2cstDeserializer = new Cs2cstDeserializer();
        gsonBuilder.registerTypeAdapter(Cs2cst.class, s2cstDeserializer);

        Cs2varDeserializer s2varDeserializer = new Cs2varDeserializer();
        gsonBuilder.registerTypeAdapter(Cs2var.class, s2varDeserializer);

        gsonBuilder.registerTypeAdapter(Ifunclo.class, new IfuncloDeserializer());

        gsonBuilder.registerTypeAdapter(Is2rt.class, new Is2rtDeserializer());
        gsonBuilder.registerTypeAdapter(S2RTbas.class, new S2RTbasDeserializer());
        gsonBuilder.registerTypeAdapter(S2RTfun.class, new S2RTfunDeserializer());
        gsonBuilder.registerTypeAdapter(S2RTtup.class, new S2RTtupDeserializer());


        gsonBuilder.registerTypeAdapter(Ityreckind.class, new ItyreckindDeserializer());

        gsonBuilder.registerTypeAdapter(TYRECKINDbox.class, new TYRECKINDboxDeserializer());
        gsonBuilder.registerTypeAdapter(TYRECKINDbox_lin.class, new TYRECKINDbox_linDeserializer());
        gsonBuilder.registerTypeAdapter(TYRECKINDflt0.class, new TYRECKINDflt0Deserializer());
        gsonBuilder.registerTypeAdapter(TYRECKINDflt1.class, new TYRECKINDflt1Deserializer());
        gsonBuilder.registerTypeAdapter(TYRECKINDflt_ext.class, new TYRECKINDflt_extDeserializer());


        gsonBuilder.registerTypeAdapter(Clabs2exp.class, new Clabs2expDeserializer());


        gsonBuilder.registerTypeAdapter(Is2exp_node.class, new Is2exp_nodeDeserializer());

        gsonBuilder.registerTypeAdapter(S2Eapp.class, new S2EappDeserializer());
        gsonBuilder.registerTypeAdapter(S2Ecst.class, new S2EcstDeserializer());
        gsonBuilder.registerTypeAdapter(S2Eeqeq.class, new S2EeqeqDeserializer());
        gsonBuilder.registerTypeAdapter(S2Eerr.class, new S2EerrDeserializer());
        gsonBuilder.registerTypeAdapter(S2Eextkind.class, new S2EextkindDeserializer());
        gsonBuilder.registerTypeAdapter(S2Efun.class, new S2EfunDeserializer());
        gsonBuilder.registerTypeAdapter(S2Eignored.class, new S2EignoredDeserializer());
        gsonBuilder.registerTypeAdapter(S2Eint.class, new S2EintDeserializer());
        gsonBuilder.registerTypeAdapter(S2Eintinf.class, new S2EintinfDeserializer());
        gsonBuilder.registerTypeAdapter(S2Esizeof.class, new S2EsizeofDeserializer());
        gsonBuilder.registerTypeAdapter(S2Eexi.class, new S2EexiDeserializer());
        gsonBuilder.registerTypeAdapter(S2Euni.class, new S2EuniDeserializer());
        gsonBuilder.registerTypeAdapter(S2Evar.class, new S2EvarDeserializer());
        gsonBuilder.registerTypeAdapter(S2Einvar.class, new S2EinvarDeserializer());
        gsonBuilder.registerTypeAdapter(S2Etyrec.class, new S2EtyrecDeserializer());
        

        /* *********** all *********** */

        PostiatsProgramDeserializer programDeserializer =
            new PostiatsProgramDeserializer(s2cstDeserializer, s2varDeserializer,
                    d2cstDeserializer, d2varDeserializer, d2conDeserializer);
        gsonBuilder.registerTypeAdapter(PostiatsProgram.class, programDeserializer);
        
        m_gson = gsonBuilder.create();
    }
    
    public PostiatsProgram trans(Reader iReader) {
        JsonReader reader = new JsonReader(iReader);
        PostiatsProgram prog = m_gson.fromJson(reader, PostiatsProgram.class);
        return prog;
    }
}
