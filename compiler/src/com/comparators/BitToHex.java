package com.comparators;

import java.util.ArrayList;
import java.util.BitSet;

public class BitToHex {
    /**
     * Turns a bitset into a hex String to be written
     * @param instruction bitset of the instruction
     * @return
     */
    public static String byteToHex(BitSet instruction){
        byte[] bytearray=instruction.toByteArray();
        String toReturn = "";
        for (byte b : bytearray) {
            String st = String.format("%02X", b);
            toReturn= st+toReturn;
        }
        return toReturn;
    }
    private static String grtBitString(BitSet bits){
        int i = 0;
        String str = "";
        while (i != 32) {
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
        return str;
    }
    public static String bitToHex(BitSet bits){
        String lines = grtBitString(bits);
        int len = lines.length();
        int i=0;
        ArrayList<String> halfByte = new ArrayList<>();
        while (i!=len){
            String toAdd="";
            int j=0;
            while (j!=4){
                toAdd= toAdd+lines.charAt(i);
                i++;
                j++;
            }
            halfByte.add(toAdd);
        }
        String hexCode = "";
        for(String str:halfByte){
            hexCode = hexCode +getHexEq(str);
        }
        return hexCode;
    }

public static String getHexEq(String eq){
    switch (eq){
        case "0000": return "0";
        case "0001":return "1";
        case "0010":return "2";
        case "0011":return "3";
        case "0100":return "4";
        case "0101":return "5";
        case "0110":return "6";
        case "0111":return "7";
        case "1000":return "8";
        case "1001":return "9";
        case "1010":return "A";
        case "1011":return "B";
        case "1100":return "C";
        case "1101":return "D";
        case "1110":return "E";
        case "1111":return "F";

    }
    return null;
}
}
