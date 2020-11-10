package com.company;

import com.FileManagement.FileManager;
import com.comparators.BitSetter;
import com.comparators.BitToHex;
import com.containers.Instruction;

import javax.swing.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.BitSet;
import javax.swing.filechooser.*;

import static com.syntax_analisis.SyntaxAnalyzerAndParser.parseTotalFile;

public class Main {
    static JLabel l;

    // a default constructor

    public static void main(String[] args) throws IOException {

        filechooser.execute();


       // printBits(BitSetter.intToBitSet(131072 ,16));
        Instruction.printErrors();

    }

    public static void printBits(BitSet bits) {
        int i = 0;
        String str = "";
        while (i != bits.size()) {
            if(i==32){
                break;
            }
            if (bits.get(i)){
                str = "1"+str;
            }
            else{
                str = "0"+str;

            }
            i++;
        }
        System.out.println(str);

    }

}
