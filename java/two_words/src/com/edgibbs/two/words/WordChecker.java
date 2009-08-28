package com.edgibbs.two.words;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: edgibbs
 * Date: Aug 28, 2009
 * Time: 9:53:43 AM
 */
public interface WordChecker {
  ArrayList<String> getDictionaryWords();

  void useDictionary(String fileName);

  int numberOfSixLetterCombinations();
}
