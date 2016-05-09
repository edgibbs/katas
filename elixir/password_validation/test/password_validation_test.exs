defmodule PasswordValidationTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest PasswordValidation

  test "rejects wrong password" do
    password_validation = fn ->
      PasswordValidation.CLI.main(nil)
    end
    assert capture_io([input: "12345"], password_validation) == "What is the password? I don't know you.\n"
  end

  test "passes with correct password" do
    password_validation = fn ->
      PasswordValidation.CLI.main(nil)
    end
    assert capture_io([input: "abc$123"], password_validation) == "What is the password? Welcome!\n"
  end

  test "rejects with wrong case version of password" do
    password_validation = fn ->
      PasswordValidation.CLI.main(nil)
    end
    assert capture_io([input: "ABC$123"], password_validation) == "What is the password? I don't know you.\n"
  end
end
