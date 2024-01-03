package com.printmanagement.util;

import java.util.Collection;
import java.util.StringJoiner;

public class StringUtils {

    public static final String Empty = "";

    public static boolean isBlank(final String str) {
        return str == null || str.isEmpty() || str.equals(" ");
    }

    public static boolean isNotBlank(final String str) {
        return !isBlank(str);
    }

    public static boolean isEmpty(final String str) {
        return str == null || str.isEmpty();
    }

    public static boolean isNotEmpty(final String str) {
        return !isEmpty(str);
    }

    public static String joinWith(final String separator, final Object... parts) {
        final StringJoiner joiner = new StringJoiner(emptyIfNull(separator));
        for (final Object part : parts) {
            joiner.add(String.valueOf(part));
        }

        return joiner.toString();
    }

    public static String join(final Object[] parts, final String separator) {
        final StringJoiner joiner = new StringJoiner(emptyIfNull(separator));
        for (final Object part : parts) {
            joiner.add(String.valueOf(part));
        }

        return joiner.toString();
    }

    public static String join(final Collection<?> parts, final String separator) {
        final StringJoiner joiner = new StringJoiner(emptyIfNull(separator));
        for (final Object part : parts) {
            joiner.add(String.valueOf(part));
        }

        return joiner.toString();
    }

    public static String trim(final String str) {
        return str == null ? null : str.trim();
    }

    public static int length(final String str) {
        return str == null ? 0 : str.length();
    }

    public static String emptyIfNull(final String str) {
        return str == null ? Empty : str;
    }

    public static String emptyIfBlank(final String str) {
        return isBlank(str) ? Empty : str;
    }

    public static String defaultIfNull(final String str, final String defaultStr) {
        return str == null ? defaultStr : str;
    }

    public static String defaultIfBlank(final String str, final String defaultStr) {
        return isBlank(str) ? defaultStr : str;
    }

    public static String uncapitalize(final String str) {
        if (isBlank(str)) {
            return str;
        }

        return Character.toLowerCase(str.charAt(0)) + str.substring(1);
    }

    public static String defaultIfEmpty(final String str, final String defaultStr) {
        return isEmpty(str) ? defaultStr : str;
    }
}