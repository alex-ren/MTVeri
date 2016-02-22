package org.ats_lang.postiats.mtv.level2parser;
import org.ats_lang.postiats.mtv.utils.ATSFileProcessor;
import org.ats_lang.postiats.mtv.utils.Log;
import org.testng.annotations.Test;

/**
 * Created by alex on 2/20/16.
 */
@Test
public class TestMain {

  @Test
  public void testSeriousness() throws Exception {
    assert true;
  }

  @Test
  public void testSeriousness1() throws Exception {

    System.out.println("hhhhhhhhhhhhhhhh");
    Log.log4j.info("hehehe1");
    Log.log4j.error("hehehe2");
    Log.log4j.warn("hehehe3");
    // ATSFileProcessor atsFile = new ATSFileProcessor("test.dats");
    // int ret = atsFile.toLevel2Json();
  }
}
