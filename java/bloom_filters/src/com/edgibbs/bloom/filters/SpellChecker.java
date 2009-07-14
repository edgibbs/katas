package com.edgibbs.bloom.filters;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class SpellChecker {

  private ArrayList<String> words;
  private boolean[] array;

  public SpellChecker() {
    array = new boolean[1000000];
  }

  public ArrayList<String> getWords() {
    return words;
  }

  public void load(String filename) {
    words = new ArrayList<String>();
    readInWordsFromFile(filename);
    hashEachWord();
  }

  public boolean check(String word) {
    if (array[hash1(word)] && array[hash2(word)] && array[hash3(word)]) {
      return true;
    }
    return false;
  }

  private void readInWordsFromFile(String filename) {
    try {
      File file = new File("resources/" + filename);
      BufferedReader reader = new BufferedReader(new FileReader(file));
      String line = null;
      while ((line = reader.readLine()) != null) {
        words.add(line);
      }
      reader.close();
    }
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }

  private void hashEachWord() {
    for (String word : words) {
      array[hash1(word)] = true;
      array[hash2(word)] = true;
      array[hash3(word)] = true;
    }
  }

  private int hash1(String word) {
    int value = 0;
    for (char character : word.toCharArray()) {
      value = value + (7 * character);
    }
    return value;
  }

  private int hash2(String word) {
    return word.getBytes().length + 7;
  }

  private int hash3(String word) {
    return word.length() * 37;
  }

}
