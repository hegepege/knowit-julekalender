package com.hegepege;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.regex.Pattern;

/**
 * Created by hegestorvold on 08/12/15.
 */
public class Julekalender {

    public void run(){
        luke1();
        luke7();
        luke8();
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


    /*
    * Finn summen av alle positive heltall mellom 0 og 1000 som er har 7 som en primtallsfaktor, der det reverserte tallet også har 7 som en primtallsfaktor.
    * For eksempel teller 259 da en får 952 om en reverserer sifrene og begge disse tallene har 7 som en primtallsfaktor.
    */
    private void luke7() {
        int sum = 0;

        for(int i = 0; i<= 1000; i++){
            if(i % 7 == 0 && reverse(i) % 7 == 0){
                sum += i;
            }
        }
        System.out.println("Luke 7: " + sum);
    }

    private int reverse(int i) {
        int reversed = 0;
        while(i > 0){
            reversed = reversed * 10 + i % 10;
            i = i /10;
        }
        return reversed;
    }


    /*
    * Vi definerer et primtall som et MIRPTALL dersom vi fortsatt har er primtall når sifrene reverseres. Regelen gjelder imidlertid ikke dersom tallet samtidig er et palindrom (dvs likt samme hvilken ende det leses fra, som 969).

    Eksempel 1: 13 er et primtall. Det er også et MIRPTALL, fordi tallet i revers, 31, også er et primtall.
    Eksempel 2: 23 er et primtall. Det er imidlertid ikke et MIRPTALL, da vi får 32 om vi reverserer det, som ikke er et primtall.
    Eksempel 3: 5 og 101 er ikke MIRPTALL, selv om de er primtall, da disse er palindromer.

    Hvor mange positive heltall under 1000 er MIRPTALL?

    Tips: Selv om 13 og 31 reverseres til hverandre er de fortsatt MIRPTALL “hver for seg” (på grunn av definisjonen). Begge må derfor telles med som en del av resultatet.
    * */
    private void luke8() {


    }
}
