package org.ats_lang.postiats.mtv.level2parser.statics;

import com.google.gson.*;
import org.ats_lang.postiats.mtv.level2parser.Cstamp;
import org.ats_lang.postiats.mtv.level2parser.Csymbol;
import org.ats_lang.postiats.mtv.utils.IntValueHolder;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cs2cstDeserializer implements JsonDeserializer<Cs2cst> {
    
    private Map<Cstamp, Cs2cst> m_map;
    private IntValueHolder m_max;
    
    public Cs2cstDeserializer() {
        m_map = new HashMap<Cstamp, Cs2cst>();
        m_max = null;
    }

    // public void setMaxHolder(IntValueHolder holder) {
    //     m_max = holder;
    // }

    Map<Cstamp, Cs2cst> getMap() {
        return m_map;
    }

    public Map<Cstamp, Cs2cst> parse_s2cstmap (
            JsonDeserializationContext context
            , JsonElement jeS2cstmap
            , IntValueHolder max) {
        m_max = new IntValueHolder(max.get());

        JsonArray jsvs = jeS2cstmap.getAsJsonArray();
        for (JsonElement jsv: jsvs) {
            context.deserialize(jsv, Cs2cst.class);
        }
        max.update(m_max.get());
        return m_map;
    }

    @Override
    public Cs2cst deserialize(JsonElement json, Type typeOfT,
            JsonDeserializationContext context) throws JsonParseException {
        JsonObject jo = json.getAsJsonObject();
        JsonElement je1 = jo.get("s2cst_stamp");
        Cstamp stamp = context.deserialize(je1, Cstamp.class);
        
        Cs2cst s2cst = m_map.get(stamp);
        if (null != s2cst) {
            return s2cst;
        } else {
            // new s2cst, update max
            m_max.update(stamp.getData());

            JsonElement je2 = jo.get("s2cst_sym");
            Csymbol symbol = context.deserialize(je2, Csymbol.class);
            
            JsonElement je3 = jo.get("s2cst_srt");
            Is2rt s2rt = context.deserialize(je3, Is2rt.class);

            JsonElement je4 = jo.get("s2cst_dconlst");
            JsonArray jarr = je4.getAsJsonArray();
            List<Cstamp> dconlst = new ArrayList<Cstamp>();
            for (JsonElement je: jarr) {
                JsonObject joD2con = je.getAsJsonObject();
                JsonElement jeStamp = joD2con.get("d2con_stamp");
                Cstamp d2con_stamp = context.deserialize(jeStamp, Cstamp.class);
                dconlst.add(d2con_stamp);
            }

            s2cst = new Cs2cst(stamp, symbol, s2rt, dconlst);
            m_map.put(stamp, s2cst);
            return s2cst;
        }
        // todo 
        // s2cst_supcls
        
    }

}
