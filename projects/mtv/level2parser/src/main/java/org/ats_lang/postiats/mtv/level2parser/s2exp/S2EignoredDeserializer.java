package org.ats_lang.postiats.mtv.level2parser.s2exp;

import java.lang.reflect.Type;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

public class S2EignoredDeserializer implements JsonDeserializer<S2Eignored> {

    @Override
    public S2Eignored deserialize(JsonElement json, Type typeOfT,
            JsonDeserializationContext context) throws JsonParseException {
        return S2Eignored.cInstance;
    }

}
