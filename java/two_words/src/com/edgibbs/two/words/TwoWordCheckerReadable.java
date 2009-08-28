package com.edgibbs.two.words;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class TwoWordCheckerReadable implements WordChecker {

  private ArrayList<String> dictionaryWords;

  public TwoWordCheckerReadable() {
    dictionaryWords = new ArrayList<String>();
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
  }

  public int numberOfSixLetterCombinations() {
    int count = 0;
    ArrayList<String> sixLetterWords = findSixLetterWords();
    for (String word : sixLetterWords) {
      if (isTwoWords(word)) {
        count++;
      }
    }
    return count;
  }

  private ArrayList<String> findSixLetterWords() {
    ArrayList<String> sixLetterWords = new ArrayList<String>();
    for (String word : dictionaryWords) {
      if (word.length() == 6) {
        sixLetterWords.add(word);
      }
    }
    return sixLetterWords;
  }

  private boolean isTwoWords(String word) {
    for (int i=0; i < lastCharacterIndex(word); i++) {
      String firstWordCandidate = word.substring(0, 5 - i);
      String secondWordCandidate = word.substring(5 - i, 6);
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
