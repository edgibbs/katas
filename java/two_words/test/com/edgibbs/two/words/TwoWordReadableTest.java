package com.edgibbs.two.words;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import org.junit.Before;
import org.junit.Ignore;

public class TwoWordReadableTest {

  private WordChecker checker;

  @Before
  public void before() {
    checker = new TwoWordCheckerPerformance();
  }

  @Test
  public void DictionaryShouldHaveNineWords() {
    checker.useDictionary("small_dictionary.txt");
    assertEquals(9, checker.getDictionaryWords().size());
  }

  @Test
  public void SmallDictionaryShouldReturnThreeSuccesses() {
    checker.useDictionary("small_dictionary.txt");
    assertEquals(3, checker.numberOfSixLetterCombinations());
  }

  @Test
  public void NoSixWordsDictionaryShouldReturnNoSuccesses() {
    checker.useDictionary("three_letter_words.txt");
    assertEquals(0, checker.numberOfSixLetterCombinations());
  }

  @Ignore
  // Note takes about 5 minutes to complete because of inefficencies
  public void LargeDictionaryShouldReturn10652Successes() {
    checker.useDictionary("dictionary.txt");
    assertEquals(10652, checker.numberOfSixLetterCombinations());
  }

}
