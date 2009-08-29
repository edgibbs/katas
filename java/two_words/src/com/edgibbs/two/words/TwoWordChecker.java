package com.edgibbs.two.words;

/**
 * Created by IntelliJ IDEA.
 * User: edgibbs
 * Date: Aug 29, 2009
 * Time: 11:27:59 AM
 */
public interface TwoWordChecker {
  
  public void useDictionary(String s);

  public int twoWordCombosForWordLength(int wordLength);

}
