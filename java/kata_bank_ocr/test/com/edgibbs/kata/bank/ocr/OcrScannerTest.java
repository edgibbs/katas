package com.edgibbs.kata.bank.ocr;

import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.Ignore;

/**
 * Created by IntelliJ IDEA.
 * User: edgibbs
 * Date: Jun 25, 2009
 * Time: 5:52:29 PM
 */
public class OcrScannerTest {

  @Test
  public void canReadinOneNumber() {
    OcrScanner scanner = new OcrScanner();
    String one = "   \n  |\n  |";
    assertEquals(1, scanner.readAccountFile(one));
  }

  @Test
  public void canReadInAccountNumber12() {
    OcrScanner scanner = new OcrScanner();
    String one = "   \n  |\n  |";
    String two = " _ \n _|\n|_ ";
    assertEquals(12, scanner.readAccountFile(one + two));
  }

}