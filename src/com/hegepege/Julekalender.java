package com.hegepege;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.nio.file.Path;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by hegestorvold on 08/12/15.
 */
public class Julekalender {

    public void run(){
        luke1();
        luke7();
    }


/*
*
* * Id strengen må begynne med 0-3 små bokstaver (fra a-z).
* Rett etter bokstavene må det følge 2-8 tall. Tallene har verdi fra og med 0 til og med 9
* Rett etter tallene må det følge en streng med minst 3 store bokstaver (fra A-Z)
*
* */
    private void luke1() {
        File exampleFile = new File("examples.txt");
        try {
            Pattern p = Pattern.compile("[a-z]{0,3}\\d{2,8}[A-Z]{3,}");
            BufferedReader reader = new BufferedReader(new FileReader(exampleFile));

            long count = reader.lines().filter(line -> p.matcher(line).matches()).count();

            System.out.println("Luke 1: " + count);

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void luke7() {
        int sum = 0;

        System.out.println("Luke 7: " + sum);
    }
}
