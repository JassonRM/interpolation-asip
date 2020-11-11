package com.containers;

import java.util.ArrayList;
import java.util.BitSet;

public class InstructionOperation {
    public static ArrayList<InstructionOperation> operations = new ArrayList<>();
    public BitSet Opcode;
    public BitSet aluOP;
    public int type;
    public String name;

    public static void parseValidOperation(String operation) {
        InstructionOperation instructionOperation = new InstructionOperation();
        String stringToParse;
        if (operation.length()==0){
            return;
        }
        if (operation.charAt(operation.length() - 1) == '\n') {
            stringToParse = operation.substring(0, operation.length() - 1);
        } else {
            stringToParse = operation;
        }
        System.out.println(operation);

        String operands[] = stringToParse.split(":");
        for (int i = 0; i < operands.length; i++) {
            switch (i) {
                case 0:
                    instructionOperation.name = operands[i];
                    break;
                case 1:
                    instructionOperation.Opcode = bitStringToBit(operands[i]);
                    break;
                case 2:
                    if (operands[i].equals("N")) {
                        instructionOperation.aluOP = new BitSet(3);
                    } else {
                        instructionOperation.aluOP = bitStringToBit(operands[i]);
                    }
                    break;
                case 3:
                    switch (operands[i]){
                        case "R":
                            instructionOperation.type=1;
                            break;
                        case "I":
                            instructionOperation.type=2;
                            break;
                        case "J":
                            instructionOperation.type=3;
                            break;
                        case "V":
                            instructionOperation.type=4;
                            break;
                    }
                    break;
            }
        }
        InstructionOperation.operations.add(instructionOperation);
    }

    public static BitSet bitStringToBit(String string) {
        BitSet bitSet = new BitSet(string.length());
        for (int i = 0; i < string.length(); i++) {
            if (string.charAt(string.length() -1-i) == '1') {
                bitSet.set(i);
            }
        }
        return bitSet;
    }
    public static void printInstructions(){
        for (InstructionOperation actual:
             InstructionOperation.operations) {
            System.out.println("La operacion es " + actual.name + " con la operacion de tipo:" + actual.type);
        }

    }
    public static ArrayList<BitSet> getOpCodeAndAluOP(String name){
        System.out.println(name);
        ArrayList<BitSet> bitSets = new ArrayList<>();
        for (InstructionOperation inst:
             InstructionOperation.operations) {
            if (inst.name.equals(name)){
                System.out.println("LOL se seteo el valor");
                bitSets.add(inst.Opcode);
                bitSets.add(inst.aluOP);
                return bitSets;
            }
        }
        bitSets.add(null);
        bitSets.add(null);
        return bitSets;
    }
    public static int getTypeOp(String name){
        for (InstructionOperation inst:InstructionOperation.operations
             ) {
            if (inst.name.equals(name)){
                return inst.type;
            }

        }
        return -1;
    }

}
