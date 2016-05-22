defmodule PasswordCheckerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest PasswordChecker

  test "12345 is very weak" do
    checker = fn -> PasswordChecker.CLI.main("12345") end
    assert capture_io([], checker) == "The password '12345' is a very weak password.\n"
  end
end
