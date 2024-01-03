package com.printmanagement.component.json;

import java.lang.reflect.Type;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import com.printmanagement.util.StringUtils;

public class JsonExternal {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final Gson gson;

    public JsonExternal() {
        gson = new GsonBuilder().serializeNulls()
                .create();
    }

    public Gson gson() {
        return gson;
    }

    public String toJson(final Object src) {
        if (src == null) {
            return null;
        }

        return gson.toJson(src);
    }

    public <T> T fromJson(final String json, final Class<T> classOfT) {
        if (StringUtils.isBlank(json)) {
            return null;
        }

        try {
            return gson.fromJson(json, classOfT);
        } catch (final JsonSyntaxException e) {
            logger.error("Cannot read JSON", e);
        }

        return null;
    }

    public <T> T fromJson(final String json) {
        if (StringUtils.isBlank(json)) {
            return null;
        }

        final Type typeOfT = new TypeToken<T>() {
        }.getType();

        try {
            return gson.fromJson(json, typeOfT);
        } catch (final JsonSyntaxException e) {
            logger.error("Cannot read JSON", e);
        }

        return null;
    }
}
