package com.edgibbs.bloom.filters;

import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.Before;

public class SpellCheckerTest {

  private SpellChecker checker;

  @Before
  public void initialize() {
    checker = new SpellChecker();
  }

  @Test
  public void shouldLoadAThreeWordFile() {
    checker.load("three_words.txt");
    assertEquals(3, checker.getWords().size());
  }

  @Test
  public void shouldShowSharkSpelledCorrectly() {
    checker.load("three_words.txt");
    assertTrue(checker.check("shark"));
  }

  @Test
  public void shouldShowShaarkSpelledWrong() {
    checker.load("three_words.txt");
    assertFalse(checker.check("shaark"));
  }

  @Test
  public void shouldHaveManyWordsInLargeFile() {
    checker.load("dictionary.txt");
    assertEquals(234936, checker.getWords().size());
  }

  @Test
  public void shouldFindAllWordsAddedToList() {
    checker.load("dictionary.txt");
    for(String word : checker.getWords()) {
      assertTrue(checker.check(word));
    }
  }

  @Test
  public void shouldFindSomeFalsePositiveLikeBa() {
    checker.load("dictionary.txt");
    assertTrue(checker.check("Ba"));
  }



}
