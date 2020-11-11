package com.FileManagement;

import com.containers.InstructionOperation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class ConfigParse {
    public static void readFile(String filename) throws IOException {

        File file = new File(filename);
        FileReader fr = new FileReader(file);
        BufferedReader br = new BufferedReader(fr);
        ArrayList<String> list = new ArrayList<>();
        String line;
        boolean ignore = true;
        System.out.println(file.getAbsolutePath());
        while ((line = br.readLine()) != null) {
            if (!ignore){
                list.add(line);
                System.out.println(line);
                ignore = false;
            }
            else {
                ignore = false;
            }
        }
        fr.close();    //closes the stream and release the resources

        for (String lineToParse:list
             ) {
            InstructionOperation.parseValidOperation(lineToParse);
        }
    }

}
