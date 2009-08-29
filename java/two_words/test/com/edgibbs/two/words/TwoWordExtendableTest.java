package com.edgibbs.two.words;

import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.*;
import static org.junit.Assert.assertEquals;

public class TwoWordExtendableTest {

  private TwoWordChecker checker;

  @Before
  public void setUp() {
    checker = new TwoWordCheckerImpl();
    checker.useDictionary("dictionary.txt");
  }

  @Test
  public void givenFourLetterWordsShouldReturn3686Successes() {
    assertEquals(3686, checker.twoWordCombosForWordLength(4));
  }

  @Test
  public void givenFiveLetterWordsShouldReturn6534Successes() {
    assertEquals(6534, checker.twoWordCombosForWordLength(5));
  }

  @Test
  public void LargeDictionaryShouldReturn10652Successes() {
    assertEquals(10652, checker.twoWordCombosForWordLength(6));
  }
}