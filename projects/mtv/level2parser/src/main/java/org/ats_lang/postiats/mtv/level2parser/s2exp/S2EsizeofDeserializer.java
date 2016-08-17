package org.ats_lang.postiats.mtv.level2parser.s2exp;


import java.lang.reflect.Type;

import com.google.gson.JsonArray;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

public class S2EsizeofDeserializer implements JsonDeserializer<S2Esizeof> {

    @Override
    public S2Esizeof deserialize(JsonElement json, Type typeOfT,
            JsonDeserializationContext context) throws JsonParseException {
    	JsonArray jarr = json.getAsJsonArray();
    	JsonElement je = jarr.get(0);
    	Cs2exp s2exp = context.deserialize(je, Cs2exp.class);
                
        return new S2Esizeof(s2exp);
    }

}
