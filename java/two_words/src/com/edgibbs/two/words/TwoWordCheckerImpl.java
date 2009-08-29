package com.edgibbs.two.words;

import java.io.File;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Set;
import java.util.HashSet;

public class TwoWordCheckerImpl implements TwoWordChecker {

  private Set<String> dictionaryWords;

  public TwoWordCheckerImpl() {
    dictionaryWords = new HashSet();
  }

  public void useDictionary(String fileName) {
    try {
      File file = new File("resources/" + fileName);
      BufferedReader reader = new BufferedReader(new FileReader(file));
      String line;
      while ((line = reader.readLine()) != null) {
        dictionaryWords.add(line.trim());
      }
    }
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }

  public int twoWordCombosForWordLength(int wordLength) {
    int count = 0;
    for (String word : getWordsForWordLength(wordLength)) {
      if (isTwoWords(word)) {
        count++;
      }
    }
    return count;
  }

  private Set<String> getWordsForWordLength(int wordLength) {
    Set<String> words = new HashSet<String>();
    for (String word : dictionaryWords) {
      if (word.length() == wordLength) {
        words.add(word);
      }
    }
    return words;
  }

  private boolean isTwoWords(String word) {
    int lastCharacterPosition = word.length() - 1;
    for (int i = 0; i < lastCharacterIndex(word); i++) {
      String firstWordCandidate = word.substring(0, lastCharacterPosition - i);
      String secondWordCandidate = word.substring(lastCharacterPosition - i, word.length());
      if (inDictionary(firstWordCandidate) && inDictionary(secondWordCandidate)) {
        return true;
      }
    }
    return false;
  }

  private boolean inDictionary(String word) {
    return dictionaryWords.contains(word);
  }

  private int lastCharacterIndex(String word) {
    return word.length() - 1;
  }

}
