package com.poly.util;

import java.security.SecureRandom;
import java.util.Locale;
import java.util.Objects;
import java.util.Random;

public class RandomString {
    private final Random random;
    private final char[] symbols;
    private final int length;

    public RandomString(int length) {
        this(length, new SecureRandom());
    }

    public RandomString(int length, Random random) {
        if (length < 1) throw new IllegalArgumentException();
        this.random = Objects.requireNonNull(random);
        this.length = length;
        this.symbols = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();
    }

    public String nextString() {
        char[] buf = new char[length];
        for (int idx = 0; idx < buf.length; idx++) {
            buf[idx] = symbols[random.nextInt(symbols.length)];
        }
        return new String(buf);
    }
}
