package org.ats_lang.postiats.mtv.level2parser.dynamics;

import com.google.gson.*;
import org.ats_lang.postiats.mtv.level2parser.Cstamp;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2cst;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2cstDeserializer;
import org.ats_lang.postiats.mtv.level2parser.statics.Cs2varDeserializer;
import org.ats_lang.postiats.mtv.utils.IntValueHolder;
import org.ats_lang.postiats.mtv.utils.JsonUtilities;

import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

public class PostiatsProgramDeserializer implements JsonDeserializer<PostiatsProgram> {
    private Cs2cstDeserializer m_s2cstDeserializer;
    private Cs2varDeserializer m_s2varDeserializer;
    private Cd2cstDeserializer m_d2cstDeserializer;
    private Cd2varDeserializer m_d2varDeserializer;
    private Cd2conDeserializer m_d2conDeserializer;

    public PostiatsProgramDeserializer(
        Cs2cstDeserializer s2cstDeserializer
        , Cs2varDeserializer s2varDeserializer
        , Cd2cstDeserializer d2cstDeserializer
        , Cd2varDeserializer d2varDeserializer
        , Cd2conDeserializer d2conDeserializer
    ) {
        m_s2cstDeserializer = s2cstDeserializer;
        m_s2varDeserializer = s2varDeserializer;
        m_d2cstDeserializer = d2cstDeserializer;
        m_d2varDeserializer = d2varDeserializer;
        m_d2conDeserializer = d2conDeserializer;
    }

    @Override
    public PostiatsProgram deserialize(JsonElement json, Type typeOfT,
            JsonDeserializationContext context) throws JsonParseException {

        IntValueHolder max = new IntValueHolder(0);
        JsonObject jobj = json.getAsJsonObject();

        // todo
        // parse s2cstmap
        JsonElement jeS2cstmap = jobj.get("s2cstmap");
        Map<Cstamp, Cs2cst> s2cstmap =
            m_s2cstDeserializer.parse_s2cstmap(context, jeS2cstmap, max);

        JsonElement jeD2eclist = jobj.get("d2eclist");

        // todo
        // List<Cd2ecl> d2ecs = JsonUtilities.deserializeList(jeD2eclist, Cd2ecl.class, context);
        PostiatsProgram prog = new PostiatsProgram(null/*d2ecs*/, null, null, null, null, null, 0 /*todo*/);
        
        return prog;
    }



}
