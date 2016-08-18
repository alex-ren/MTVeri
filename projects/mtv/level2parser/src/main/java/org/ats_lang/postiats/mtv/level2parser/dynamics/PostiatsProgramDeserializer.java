package org.ats_lang.postiats.mtv.level2parser.dynamics;

import com.google.gson.*;
import org.ats_lang.postiats.mtv.utils.JsonUtilities;

import java.lang.reflect.Type;
import java.util.List;

public class PostiatsProgramDeserializer implements JsonDeserializer<PostiatsProgram> {

    @Override
    public PostiatsProgram deserialize(JsonElement json, Type typeOfT,
            JsonDeserializationContext context) throws JsonParseException {
        JsonObject jobj = json.getAsJsonObject();
        JsonElement jeS2cstmap = jobj.get("s2cstmap");
        // todo
        // parse s2cstmap

        JsonElement jeD2eclist = jobj.get("d2eclist");

        List<Cd2ecl> d2ecs = JsonUtilities.deserializeList(jeD2eclist, Cd2ecl.class, context);
        PostiatsProgram prog = new PostiatsProgram(d2ecs, null, null, null, null, null, 0 /*todo*/);
        
        return prog;
    }


}
