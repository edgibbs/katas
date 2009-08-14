package com.edgibbs.anagrams;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

public class Anagram {

  private ArrayList<Word> words;
  private ArrayList<Word> dictionaryWords;

  public Anagram() {
    words = new ArrayList<Word>();
    dictionaryWords = new ArrayList<Word>();
  }

  public void loadDictionary(String fileName) {
    readFileAndLoadWords(fileName, dictionaryWords);
  }

  public void loadWords(String fileName) {
    readFileAndLoadWords(fileName, words);
  }


  public int setsOfAnagrams() {
    HashMap<String, ArrayList<String>> anagramSets = new HashMap<String, ArrayList<String>>();
    int sets = 0;
    for (Word word : words) {
      ArrayList<String> anagrams = new ArrayList<String>();
      for (Word dictionaryWord : dictionaryWords) {
        if (isAnagram(word, dictionaryWord)) {
          anagrams.add(dictionaryWord.toString());
          sets++;
        }
      }
      anagramSets.put(word.toString(), anagrams);
    }
    return sets;
  }

  public int wordCount() {
    return dictionaryWords.size();
  }

  private boolean isAnagram(Word word, Word dictionaryWord) {
    // TODO probably need better optimization here as this is only about twice as fast for checking
    if (word.letterKey() != dictionaryWord.letterKey()) {
      return false;
    }
    char[] letters = word.toString().toCharArray();
    char[] dictionaryLetters = dictionaryWord.toString().toCharArray();

    String sortedWord = arrayToAlphabeticalString(letters);
    String sortedDictionaryWord = arrayToAlphabeticalString(dictionaryLetters);

    return sortedWord.equals(sortedDictionaryWord) && !(word.equals(dictionaryWord));
  }

  private String arrayToAlphabeticalString(char[] letters) {
    Arrays.sort(letters);
    StringBuffer letterString = new StringBuffer();
    for (char letter : letters) {
      letterString.append(letter);
    }
    return letterString.toString();
  }


  private void readFileAndLoadWords(String fileName, ArrayList<Word> list) {
    try {
      File file = new File("resources/" + fileName);
      BufferedReader reader = new BufferedReader(new FileReader(file));
      String line;
      while ((line = reader.readLine()) != null) {
        list.add(new Word(line.trim()));
      }
      reader.close();
    }
    catch (IOException ex) {
      ex.printStackTrace();
    }
  }


}
