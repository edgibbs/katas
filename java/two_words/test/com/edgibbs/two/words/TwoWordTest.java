package com.edgibbs.two.words;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import org.junit.Ignore;
import org.junit.Before;

public class TwoWordTest {

  private TwoWordChecker checker;

  @Before
  public void before() {
    checker = new TwoWordChecker();
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

  @Test    // Note takes about 5 minutes to complete because of inefficencies
  public void LargeDictionaryShouldReturn10652Successes() {
    checker.useDictionary("dictionary.txt");
    assertEquals(10652, checker.numberOfSixLetterCombinations());
  }

}
