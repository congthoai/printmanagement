package com.printmanagement.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Collection;

public class JdbcConverter {

    public static int[] toInts(final Collection<Integer> values) {
        if (values == null) {
            return null;
        }

        if (values.isEmpty()) {
            return new int[0];
        }

        final int[] result = new int[values.size()];
        int index = 0;
        for (final int value : values) {
            result[index++] = value;
        }

        return result;
    }

    public static float[] toFloats(final Collection<Float> values) {
        if (values == null) {
            return null;
        }

        if (values.isEmpty()) {
            return new float[0];
        }

        final float[] result = new float[values.size()];
        int index = 0;
        for (final float value : values) {
            result[index++] = value;
        }

        return result;
    }

    public static boolean[] toBools(final Collection<Boolean> values) {
        if (values == null) {
            return null;
        }

        if (values.isEmpty()) {
            return new boolean[0];
        }

        final boolean[] result = new boolean[values.size()];
        int index = 0;
        for (final boolean value : values) {
            result[index++] = value;
        }

        return result;
    }

    public static String[] toStrings(final Collection<String> values) {
        if (values == null) {
            return null;
        }

        if (values.isEmpty()) {
            return new String[0];
        }

        final String[] result = new String[values.size()];
        int index = 0;
        for (final String value : values) {
            result[index++] = value;
        }

        return result;
    }

    public static Timestamp toTimestamp(final Long value) {
        return value == null ? null : new Timestamp(value);
    }

    public static Long getTime(final Timestamp time) {
        return getTime(time, null);
    }

    public static Long getTime(final Timestamp time, final Long defaultValue) {
        /**
         * @doc Ternary expression will convert two results to the same type;
         * @throws NullPointerException If the 'defaultValue' null, 'time.getTime' long.
         */
        return (time == null) ? defaultValue : (Long) time.getTime();
    }

    public static Long getTime(final ResultSet rs, final String columnName) throws SQLException {
        return getTime(rs.getTimestamp(columnName), null);
    }

    public static Long getTime(final ResultSet rs, final String columnName, final Long defaultvalue)
            throws SQLException {
        return getTime(rs.getTimestamp(columnName), defaultvalue);
    }
}
