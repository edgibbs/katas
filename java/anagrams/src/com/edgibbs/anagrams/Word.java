package com.edgibbs.anagrams;

/**
 * Created by IntelliJ IDEA.
 * User: edgibbs
 * Date: Jul 20, 2009
 * Time: 10:49:51 AM
 */
public class Word {
  private String word;

  public Word(String word) {
    this.word = word;
  }

  public int letterKey() {
    return getKeyValueFromAddingCharacters();
  }

  private int getKeyValueFromAddingCharacters() {
    char[] letters = word.toCharArray();
    int keyValue = 0;
    for (char letter : letters) {
      keyValue += letter;
    }
    return keyValue;
  }

  @Override
  public String toString() {
    return word;
  }

  @Override
  public boolean equals(Object object) {
    if (object == this) {
      return true;
    }
    if (!(object instanceof Word)) {
      return false;
    }
    Word comparisonWord = (Word)object;
    return comparisonWord.word.equals(this.word);
  }

  @Override
  public int hashCode() {
    return word.hashCode() * 31;
  }

}
