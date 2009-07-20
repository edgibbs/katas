package com.edgibbs.anagrams;

import org.junit.Test;
import static org.junit.Assert.*;


public class WordTest {

  @Test
  public void arrestAndRarestShouldBeAnagrams() {
    Word arrest = new Word("arrest");
    Word rarest = new Word("rarest");
    assertEquals(arrest.letterKey(), rarest.letterKey());
  }

}
