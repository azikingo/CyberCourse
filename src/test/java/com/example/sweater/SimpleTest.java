package com.example.fiery;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class SimpleTest {
//    @Test
    public void test(){
        int x = 2;
        int y = 23;

        Assertions.assertEquals(46,x * y);
        Assertions.assertEquals(25,x + y);
    }

//    @Test
    public void error(){
        int i = 0;
        int il = 1 / i;
    }
}
