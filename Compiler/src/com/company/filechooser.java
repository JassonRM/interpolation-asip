package com.company;

import com.FileManagement.FileManager;
import com.comparators.BitToHex;
import com.containers.Instruction;

import java.io.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.ArrayList;
import javax.swing.filechooser.*;

import static com.syntax_analisis.SyntaxAnalyzerAndParser.parseTotalFile;

public class filechooser extends JFrame implements ActionListener {
    // Jlabel to show the files user selects
    static JLabel saveDirectory;
    static JLabel loadDirectory;
    public static JLabel error;
    static String fileToRead;
    static String fileToWrite;

    // a default constructor
    filechooser()
    {
    }

    public static void execute()
    {

        // frame to contains GUI elements
        JFrame f = new JFrame("MDIE compiler");

        // set the size of the frame
        f.setSize(400, 200);
        f.setResizable(false);

        // set the frame's visibility
        f.setVisible(true);

        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JButton button1 = new JButton("save");
        JButton button2 = new JButton("open");
        JButton button3 = new JButton("compile");

        filechooser f1 = new filechooser();


        button3.addActionListener(f1);
        button1.addActionListener(f1);
        button2.addActionListener(f1);

        // make a panel to add the buttons and labels
        JPanel p = new JPanel();
        p.setLayout(new BoxLayout(p, BoxLayout.PAGE_AXIS));

        // add buttons to the frame
        p.add(button1);
        p.add(button2);
        p.add(button3);


        // set the label to its initial value
        saveDirectory = new JLabel("no file selected");
        loadDirectory = new JLabel("no file selected");
        error = new JLabel("Error: None");
        // add panel to the frame
        p.add(saveDirectory);
        p.add(loadDirectory);
        p.add(error);
        f.add(p);

        f.show();
    }
    public void actionPerformed(ActionEvent evt)
    {
        // if the user presses the save button show the save dialog
        String com = evt.getActionCommand();

        if (com.equals("save")) {
            // create an object of JFileChooser class
            JFileChooser j = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());

            // resctrict the user to selec files of all types
            j.setAcceptAllFileFilterUsed(false);

            // set a title for the dialog
            j.setDialogTitle("Select a .txt file");

            // only allow files of .txt extension
            FileNameExtensionFilter restrict = new FileNameExtensionFilter("AnyFormat", "txt");
            j.addChoosableFileFilter(restrict);

            // invoke the showsSaveDialog function to show the save dialog
            int r = j.showSaveDialog(null);

            // if the user selects a file
            if (r == JFileChooser.APPROVE_OPTION)

            {
                // set the label to the path of the selected file
                saveDirectory.setText(j.getSelectedFile().getAbsolutePath());
                fileToWrite=j.getSelectedFile().getAbsolutePath();
            }
            // if the user cancelled the operation
            else
                saveDirectory.setText("the user cancelled the operation");
        }
        // if the user presses the open dialog show the open dialog

        else if(com.equals("open")) {
            // create an object of JFileChooser class
            JFileChooser j = new JFileChooser(FileSystemView.getFileSystemView().getHomeDirectory());

            // resctrict the user to selec files of all types
            j.setAcceptAllFileFilterUsed(false);

            // set a title for the dialog
            j.setDialogTitle("Select a .txt file");

            // only allow files of .txt extension
            FileNameExtensionFilter restrict = new FileNameExtensionFilter(".txt and .mdie", "txt","mide");
            j.addChoosableFileFilter(restrict);

            // invoke the showsOpenDialog function to show the save dialog
            int r = j.showOpenDialog(null);

            // if the user selects a file
            if (r == JFileChooser.APPROVE_OPTION) {
                // set the label to the path of the selected file
                loadDirectory.setText(j.getSelectedFile().getAbsolutePath());
                fileToRead=j.getSelectedFile().getAbsolutePath();
            }
            // if the user cancelled the operation
            else
                loadDirectory.setText("the user cancelled the operation");
        }
        else {
            if(!(saveDirectory.getText().equals("the user cancelled the operation")||
            loadDirectory.getText().equals("the user cancelled the operation"))){
                try {
                    compile();
                } catch (IOException e) {
                }

            }

        }
    }

    private void compile() throws IOException {
        Instruction.instList = new ArrayList<>();
        ArrayList<String> lines = FileManager.getFileLines(fileToRead);
        parseTotalFile(lines);
        for (Instruction inst:Instruction.instList){
            System.out.println(BitToHex.bitToHex(inst.bitSet));
        }
        FileManager.writeFile(fileToWrite);
    }
}