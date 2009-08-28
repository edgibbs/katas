package com.edgibbs.two.words;

import java.util.ArrayList;
import java.util.Set;
import java.util.HashSet;
import java.io.File;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class TwoWordCheckerPerformance implements WordChecker {

  private ArrayList<String> dictionaryWords;
  private ArrayList<String> sixLetterWords;
  private Set<String> fiveOrLessLetterWords;  //set ended up making a big difference over an ArrayList for contains()

  public TwoWordCheckerPerformance() {
    dictionaryWords = new ArrayList<String>();
    sixLetterWords = new ArrayList<String>();
    fiveOrLessLetterWords = new HashSet<String>();
  }

  public ArrayList<String> getDictionaryWords() {
    return this.dictionaryWords;
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
    populateSixLetterWords();
    populateFiveOrLessLetterWords();
  }


  public int numberOfSixLetterCombinations() {
    int count = 0;
    for (String word : sixLetterWords) {
      if (isTwoWords(word)) {
        count++;
      }
    }
    return count;
  }

  private void populateSixLetterWords() {
    for (String word : dictionaryWords) {
      if (word.length() == 6) {
        sixLetterWords.add(word);
      }
    }
  }

  private void populateFiveOrLessLetterWords() {
    for (String word : dictionaryWords) {
      if (word.length() < 6) {
        fiveOrLessLetterWords.add(word);
      }
    }
  }

  private boolean isTwoWords(String word) {
    for (int i = 0; i < lastCharacterIndex(word); i++) {
      String firstWordCandidate = word.substring(0, 5 - i);
      String secondWordCandidate = word.substring(5 - i, 6);
      if (inDictionary(firstWordCandidate) && inDictionary(secondWordCandidate)) {
        return true;
      }
    }
    return false;
  }


  private boolean inDictionary(String word) {
    //set ended up making a big difference over an ArrayList for contains()
    return fiveOrLessLetterWords.contains(word);
  }

  private int lastCharacterIndex(String word) {
    return word.length() - 1;
  }

}
