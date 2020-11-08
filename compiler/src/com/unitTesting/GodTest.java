package com.unitTesting;


import com.syntax_analisis.SyntaxAnalyzerAndParser;
import org.junit.Test;

import java.util.ArrayList;

import static org.junit.Assert.*;

public class GodTest {

    @Test
    public void testGetOperation() {
        ArrayList<String> list = SyntaxAnalyzerAndParser.getOperation("add R1,R2,R3;");
        ArrayList<String> result_actual = new ArrayList<String>();
        result_actual.add("add");
        result_actual.add("R1,R2,R3;");
        assertEquals(result_actual, list);
        list = SyntaxAnalyzerAndParser.getOperands(list);
        result_actual = new ArrayList<>();
        result_actual.add("add");
        result_actual.add("R1");
        result_actual.add("R2");
        result_actual.add("R3");
        assertEquals(result_actual, list);
        assertEquals(result_actual, SyntaxAnalyzerAndParser.parseLine("add R1,R2,R3;"));


    }
}
