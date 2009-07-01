package com.edgibbs.kata.bank.ocr;

/**
 * Created by IntelliJ IDEA.
 * User: edgibbs
 * Date: Jun 25, 2009
 * Time: 6:13:25 PM
 */
public class AccountNumber {
  public static final String ONE = "   \n  |\n  |";
  public static final String TWO = " _ \n _|\n|_ ";
  

  public int convert(String ocrNumber) {
    if (ocrNumber.equals(ONE)) {
      return 1;
    }
    if (ocrNumber.equals(TWO)) {
      return 2;
    }
    else {
      return -1;
    }
  }

}
