package org.ats_lang.postiats.mtv.level2parser;

import org.ats_lang.postiats.mtv.utils.ATSFileProcessor;
import org.ats_lang.postiats.mtv.utils.Log;

import java.io.IOException;

/**
 * Created by alex on 2/19/16.
 */
public class Main {
    public int test(int x, int y) {
        return x + y;
    }

    public static void main(String [] args) throws IOException, InterruptedException {
        System.out.println("helloworld");
        Log.log4j.warn("log4j is working");


        ATSFileProcessor atsFile = new ATSFileProcessor("test.dats");
        int ret = atsFile.toLevel2Json();






    }
}
