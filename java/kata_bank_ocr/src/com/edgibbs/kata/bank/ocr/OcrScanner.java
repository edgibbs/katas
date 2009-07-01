package com.edgibbs.kata.bank.ocr;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: edgibbs
 * Date: Jun 25, 2009
 * Time: 6:03:32 PM
 */
public class OcrScanner {


  public int readAccountFile(String accountFiles) {
    AccountNumber account = new AccountNumber();
    // have to parse out every 9 characters
    int numberOfSplits = accountFiles.length() / 11;
    System.out.println(numberOfSplits);
    ArrayList<String> numbers = new ArrayList<String>();

    for (int i = 0; i < numberOfSplits; i++) {
      int startPosition = i * 11;
      int endPosition = startPosition + 11;

      if (endPosition > accountFiles.length()) {
        endPosition = accountFiles.length();
      }

      String substring = accountFiles.substring(startPosition, endPosition);

      numbers.add(substring);
    }

    ArrayList<String> finalNumbers = new ArrayList<String>();
    for (String number : numbers) {
      System.out.println("String numbers:" + number + "end");
      finalNumbers.add(Integer.toString(account.convert(number)));
    }

    StringBuffer result = new StringBuffer();
    for (String number : finalNumbers) {
       result.append(number);
    }
    System.out.println("result: " + result);
    
    return Integer.parseInt(result.toString());
  }
}
