package com.containers;

import com.company.Main;
import com.comparators.BitToHex;
import com.comparators.ToBinConverter;
import com.comparators.TypeComparator;
import com.syntax_analisis.SyntaxAnalyzerAndParser;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.BitSet;

public class Instruction {
    public static ArrayList<Instruction> instList = new ArrayList<>();
    public String assemblyLine;
    public ArrayList<String> parsedLine;
    public ArrayList<BitSet> bitLine = new ArrayList<>();
    public boolean attachedToLabel = false;
    public String labelAttached = null;
    public boolean error = false;
    public String errorType;
    public int line;
    public BitSet bitSet;

    /**
     * prints the instruction data
     */
    public void printInstructionInfo() {
        if (error == false) {
            System.out.println("Line:" + assemblyLine);
            System.out.println("Operation:" + parsedLine.get(0));
            int i = 1;
            while (i < parsedLine.size()) {
                System.out.println("Operand" + (i - 1) + ":" + parsedLine.get(i));
            }
            System.out.println("BitValue= " + bitLine);
        } else {
            System.out.println("Error in line:" + line + "\n Type: " + errorType);
        }
    }

    /**
     * Creates a new instruction
     *
     * @param line      assembly line
     * @param labelUp   if it contains a label
     * @param labelName the name of the label
     * @param numLine   the number of the line
     */
    public Instruction(String line, Boolean labelUp, String labelName, int numLine) {
        this.line = numLine;
        instList.add(this);
        this.assemblyLine = line;
        if (assemblyLine.equals("stall")){
            return;
        }
        this.parsedLine = new ArrayList<>();
        parsedLine = SyntaxAnalyzerAndParser.parseLine(line);
        attachedToLabel = labelUp;
        if (attachedToLabel == true) {
            labelAttached = labelName;
        }
        if (parsedLine == null) {
            error = true;
            errorType = "No se logro leer la linea";
        }
    }

    /**
     * Sets the instruction line
     */
    public void setBitLine() {
        if (this.assemblyLine.equals("stall")){
            this.bitLine=null;
        }
        try {
            this.bitLine = ToBinConverter.getBitSet(this.parsedLine,this);

        }
        catch (Exception e){
            this.error = true;
            this.errorType = "Error al parseo de la linea, caracter invalido";
        }
    }

    /**
     * Gets the number of the instruction multiplied by 4 that contains the label
     *
     * @param label which label the instruction jumping to
     * @return the number of instruction multiplied by 4
     */
    public static int getFromLabel(String label) {

        for (Instruction inst : instList) {
            if (inst.attachedToLabel) {
                if (inst.labelAttached.equals( label)) {
                    return inst.line * 4;
                }
            }
        }
        return -1;
    }

    /**
     * Sets the instruction bit values
     */
    public void setBitSet() {
        this.bitSet = new BitSet(32);
        if (error){
            return;
        }
        if (this.assemblyLine.equals("stall")){
            return;
        }
        int type = TypeComparator.type(this.parsedLine.get(0));
        if (type == -1) {
            error = true;
            errorType = "No se logro identificar la operacion";
        } else if (type == 1) {
            parseRType();

        } else if ((type == 2)) {
            System.out.println("Type I");
            parseIType();
        } else if (type == 3) {
            parseJType();
        } else if (type == 4) {
            parseVType();
        }
    }

    private void parseRType() {
        if ((this.parsedLine.get(0).equals("JR")|| this.parsedLine.get(0).equals("jr") )) {
            this.setOpCode();
            this.setRs1();
            return;
        }        if(this.parsedLine.get(0).toLowerCase().equals("stw")){

            this.setRS1Special();
            this.setRs2Special();
            this.setOpCode();
            this.setALUop();
            return;
        }
        this.setRDnRS1();
        this.setRs2();
        this.setOpCode();
        this.setALUop();

    }

    private void parseIType() {
        this.setRDnRS1();
        this.setOpCode();
        this.setImm();

    }

    private void parseJType() {
        this.setOpCode();
        this.setAddress();
    }

    private void parseVType() {
        if(this.parsedLine.get(0).toLowerCase().equals("vstb")){
            System.out.println("LOLOLOLOL");
            this.setRS1Special();
            this.setRs2Special();
            this.setOpCode();
            this.setALUop();
            return;
        }
        this.setRDnRS1();
        this.setRs2();
        this.setOpCode();
        this.setALUop();

    }

    private void setRDnRS1() {
        try {


            BitSet RD = this.bitLine.get(2);
            BitSet Rs1 = this.bitLine.get(3);
            int beginIndex = 22;
            int len = 5;
            int i = 0;
            while (i != len) {
                this.bitSet.set(beginIndex + i, RD.get(i));
                i++;

            }
            i = 0;
            beginIndex = 17;
            while (i != len) {
                this.bitSet.set(beginIndex + i, Rs1.get(i));
                i++;
            }
        }
        catch (Exception e){
            System.out.println(assemblyLine);
        }

    }
    private void setRS1Special() {
        try {
            BitSet Rs1 = this.bitLine.get(2);
            int beginIndex = 22;
            int len = 5;
            int i = 0;
            beginIndex = 17;
            while (i != len) {
                this.bitSet.set(beginIndex + i, Rs1.get(i));
                i++;
            }
        }
        catch (Exception e){
            System.out.println(assemblyLine);
        }

    }

    private void setOpCode() {
        BitSet opCode = this.bitLine.get(0);
        int i = 0;
        int len = 5;
        int offset = 27;
        while (i != len) {
            this.bitSet.set(offset + i, opCode.get(i));
            i++;
        }
    }
    private void setRs2Special(){
        BitSet Rs1;
        try {
            Rs1 = this.bitLine.get(3);
        } catch (Exception e) {
            return;
        }
        int i = 0;
        int len = 5;
        int offset = 12;
        while (i != len) {
            this.bitSet.set(offset + i, Rs1.get(i));
            i++;

        }
    }
    private void setRs2() {
        BitSet Rs1;
        try {
            Rs1 = this.bitLine.get(4);
        } catch (Exception e) {
            return;
        }
        int i = 0;
        int len = 5;
        int offset = 12;
        while (i != len) {
            this.bitSet.set(offset + i, Rs1.get(i));
            i++;

        }
    }

    private void setAddress() {
        BitSet address = this.bitLine.get(2);
        int i = 0;
        int len = 27;
        while (i != len) {
            this.bitSet.set(i, address.get(i));
            i++;

        }
    }

    private void setImm() {
        int i = 0;
        BitSet imm = this.bitLine.get(4);
        int len = 16;
        if (imm.length()>16){
            this.error=true;
            this.errorType="Inmediato supera el numero maximo de bytes";
        }
        while (i != len) {
            this.bitSet.set(i + 1, imm.get(i));
            i++;

        }
    }

    private void setALUop() {
        int i = 0;
        BitSet ALUop = this.bitLine.get(1);
        int len = 3;
        int offset = 9;
        while (i != len) {
            this.bitSet.set(i + offset, ALUop.get(i));
            i++;

        }
    }

    private void setRs1() {
        BitSet Rs1 = this.bitLine.get(2);
        int i = 0;
        int beginIndex = 17;
        int len =5;
        while (i != len) {
            this.bitSet.set(beginIndex + i, Rs1.get(i));
            i++;
        }
    }
    public static void printErrors(){
        for (Instruction ins: Instruction.instList)
            if(ins.error){
                System.out.println("Error: " +ins.errorType + "\n" + "Linea:" + ins.line +":"+ ins.assemblyLine);
            }
    }
    public static String returnErrors(){
        String toReturn = "";
        for (Instruction ins: Instruction.instList)
            if(ins.error){
                toReturn = toReturn + "Error: " +ins.errorType + "\n" + "Linea:" + ins.line +":"+ ins.assemblyLine +"\n";
            }
        return toReturn;

    }
    public static boolean isError(){
        for (Instruction ins:Instruction.instList){
            if (ins.error){
                return true;
            }
        }
        return false;
    }
}
