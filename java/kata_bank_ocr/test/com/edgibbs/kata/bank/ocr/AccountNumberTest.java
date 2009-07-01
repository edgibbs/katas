package com.edgibbs.kata.bank.ocr;

import static org.junit.Assert.*;

import org.junit.Test;

/**
 * Created by IntelliJ IDEA.
 * User: edgibbs
 * Date: Jun 25, 2009
 * Time: 6:13:43 PM
 */
public class AccountNumberTest {

  @Test
  public void shouldReturnNumber1() {
    AccountNumber account = new AccountNumber();
    assertEquals(1, account.convert("   \n  |\n  |"));
  }

  @Test public void shouldReturnNumber2() {
    AccountNumber account = new AccountNumber();
    assertEquals(2, account.convert(" _ \n _|\n|_ "));
  }
}
