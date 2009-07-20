package com.edgibbs.anagrams;
import static org.junit.Assert.*;
import org.junit.Test;
import org.junit.Before;
import org.junit.Ignore;

public class AnagramTest {
  private Anagram anagram;

  @Before
  public void before() {
    anagram = new Anagram();
  }

  @Test
  public void shouldLoadAllWordsIntoList() {
    anagram.loadDictionary("small_dictionary.txt");
    assertEquals(4, anagram.wordCount());
  }

  @Test
  public void shouldFindOneAnagramForSmallDictionary() {
    anagram.loadDictionary("small_dictionary.txt");
    anagram.loadWords("three_words.txt");
    assertEquals(1, anagram.setsOfAnagrams());
  }

  @Test
  public void ShouldFindSixAnagramsForLargeDictionary() {
    anagram.loadDictionary("dictionary.txt");
    anagram.loadWords("three_words.txt");
    assertEquals(6, anagram.setsOfAnagrams());
  }
}
