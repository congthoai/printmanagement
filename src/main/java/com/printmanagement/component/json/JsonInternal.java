package com.printmanagement.component.json;

import java.lang.reflect.Type;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;
import com.printmanagement.util.StringUtils;

import antlr.collections.List;

/**
 * This class support {@link JsonShortName} to optimize memory and bandwidth
 */
public class JsonInternal {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final Gson gson;

    public JsonInternal() {
        gson = new GsonBuilder().serializeNulls()
                .setFieldNamingStrategy(f -> {
                    if (f.isAnnotationPresent(JsonShortName.class)) {
                        return f.getAnnotation(JsonShortName.class)
                                .value();
                    }

                    return f.getName();
                })
                .create();
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

    public <T> T fromJson(final String json, final Type typeOfT) {
        if (StringUtils.isBlank(json)) {
            return null;
        }

        try {
            return gson.fromJson(json, typeOfT);
        } catch (final JsonSyntaxException e) {
            logger.error("Cannot read JSON", e);
        }

        return null;
    }

    public <T> List listFromJson(final String json, final Type typeOfT) {
        if (StringUtils.isBlank(json)) {
            return null;
        }

        try {
            return gson.fromJson(json, typeOfT);
        } catch (final JsonSyntaxException e) {
            logger.error("Cannot read JSON", e);
        }

        return null;
    }

    public <T> T fromJson(final JsonObject json, final Class<T> classOfT) {
        if (json == null) {
            return null;
        }

        try {
            return gson.fromJson(json, classOfT);
        } catch (final JsonSyntaxException e) {
            logger.error("Cannot read JSON", e);
        }

        return null;
    }
}

