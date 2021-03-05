package com.example.fiery;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class DumbPasswordEncoderTest {

    @Test
    void encode() {
        DumbPasswordEncoder encoder = new DumbPasswordEncoder();
        Assertions.assertEquals("secret: 'mypwd'", encoder.encode("mypwd"));
    }
}