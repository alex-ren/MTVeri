package org.ats_lang.postiats.mtv.level2parser;

import org.ats_lang.postiats.mtv.utils.ATSFileProcessor;
import org.ats_lang.postiats.mtv.utils.FilenameUtils;
import org.ats_lang.postiats.mtv.utils.Log;
import org.ats_lang.postiats.mtv.utils.SystemEnv;

import java.io.*;
import java.util.List;

/**
 * Created by alex on 2/19/16.
 */
public class Main {
    public int test(int x, int y) {
        return x + y;
    }

    public static void main(String[] args) throws IOException, InterruptedException {
        System.out.println("helloworld");
        Log.log4j.warn("log4j is working");


        String[] paths = {
                "test.dats",

//		"src/jats/utfpl/stfpl/test/01_funcall_return_void.dats",
//				"src/jats/utfpl/stfpl/test/02_closure_call.dats",
//				"src/jats/utfpl/stfpl/test/02_2_closure_level.dats",
////				"src/jats/utfpl/stfpl/test/02_3_closure_return.dats", // This is not working, since S2EFun has no info of closure.
//				"src/jats/utfpl/stfpl/test/03_symbol_opr.dats",
//				"src/jats/utfpl/stfpl/test/04_if_function.dats",
//        		"src/jats/utfpl/stfpl/test/04_2_if_function_tag.dats",
//				"src/jats/utfpl/stfpl/test/05_use_ref.dats",
//				"src/jats/utfpl/stfpl/test/06_mc_assert.dats",
//				"src/jats/utfpl/stfpl/test/07_use_array.dats",
//				"src/jats/utfpl/stfpl/test/08_use_mutex.dats",
//				"src/jats/utfpl/stfpl/test/09_tuple.dats",
//				"src/jats/utfpl/stfpl/test/10_create_thread.dats",
//				"src/jats/utfpl/stfpl/test/11_fact_fun.dats",
//				"src/jats/utfpl/stfpl/test/12_fact_closure.dats",
//				"src/jats/utfpl/stfpl/test/13_if_noeffect.dats",
//				"src/jats/utfpl/stfpl/test/14_create_threads.dats",
//				"src/jats/utfpl/stfpl/test/15_thread_cond.dats",
//				"src/jats/utfpl/stfpl/test/15_2_thread_cond.dats",
//				"src/jats/utfpl/stfpl/test/16_producer_consumer.dats",
//				"src/jats/utfpl/stfpl/test/16_1_producer_consumer_m_1.dats",
//        		"src/jats/utfpl/stfpl/test/16_2_producer_consumer_m_1_2cond.dats",
//        		"src/jats/utfpl/stfpl/test/16_3_producer_consumer_m_m_signal.dats",
//        		"src/jats/utfpl/stfpl/test/16_4_producer_consumer_m_m_broadcast.dats",
//				"src/jats/utfpl/stfpl/test/17_mcset_mcget.dats",
//        		"src/jats/utfpl/stfpl/test/17_1_mcset_mcget_calc.dats",
//				"src/jats/utfpl/stfpl/test/18_atomic_opr.dats",
//				"src/jats/utfpl/stfpl/test/19_mc_view.dats",
//        		"src/jats/utfpl/stfpl/test/20_four_slot.dats",
//        		"src/jats/utfpl/stfpl/test/20_1_two_slot_acm.dats",
//        		"src/jats/utfpl/stfpl/test/20_2_three_slot_acm.dats",
//        		"src/jats/utfpl/stfpl/test/20_3_four_slot_acm.dats",
//        		"src/jats/utfpl/stfpl/test/21_global_val.dats",
//        		"src/jats/utfpl/stfpl/test/22_remove_proof.dats",
//        		"src/jats/utfpl/stfpl/test/23_use_condition.dats",
//        		"src/jats/utfpl/stfpl/test/24_global_ghost_variable.dats",
//         		"src/jats/utfpl/stfpl/test/temp.dats",
//        		"src/jats/utfpl/stfpl/test/25_scheduler.dats"
//              "src/jats/utfpl/stfpl/test/26_peterson_exclusion.dats"

        };

        for (String strPath : paths) {
            String m_inputpath = strPath;
            String m_patpath = SystemEnv.getPATPath();


            System.out.println("==Processing file " + m_inputpath + "==========");
            System.out.println("");

            ATSFileProcessor atsFile = new ATSFileProcessor(m_inputpath);
            int ret = atsFile.toLevel2Json();

            if (0 == ret) {
                System.out.println("json file is " + atsFile.getPathLevel2Json().getName());
                FileReader fReader = new FileReader(atsFile.getPathLevel2Json());
                System.out.println("== Parsing JSON start ==========================");
                PostiatsLevel2ParserJson level2Parser = new PostiatsLevel2ParserJson();
                // ProgramStfpl2 prog2 = level2Parser.trans(fReader);
                System.out.println("== Parsing JSON end   ==========================");
            }





                // System.out.println("== Type Checking start ==========================");
                // StfplTypeChecker tyChecker = new StfplTypeChecker(prog2);
                // tyChecker.typecheck();
                // System.out.println("== Type Checking end   ==========================");

                // ProgramStfpl2Printer sPrinter2 = new ProgramStfpl2Printer();
                // String outputSTFPL2 = sPrinter2.print(prog2);

                // System.out.println("==stfpl's ast code (layer 02) is ==========================");
                // System.out.println(outputSTFPL2);
                // FileWriter fwSTFPL2 = new FileWriter(FilenameUtils.changeExt(path_json, FilenameUtils.cSTFPL2));
                // BufferedWriter bwSTFPL2 = new BufferedWriter(fwSTFPL2);
                // bwSTFPL2.write(outputSTFPL2);
                // bwSTFPL2.close();

                // m_dyn = outputSTFPL2;
                // if (level <= 2) {
                //  	System.out.println("\n" + "==" + m_inputpath + " is O.K. " + " ==============================================================================\n");
                //  	return 0;
                //  }
            }


        }

    private static String readFromProcess(InputStream is) throws IOException {
        String line = null;
        String lines = "";
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        while ((line = reader.readLine()) != null) {
            lines += line;
        }
        return lines;
    }

    static String getProcessCommand(ProcessBuilder pb) {
        List<String> coms = pb.command();
        String command = "";
        for (String com : coms) {
            command += com + " ";
        }

        return command;
    }
}

