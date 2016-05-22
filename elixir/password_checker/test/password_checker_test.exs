defmodule PasswordCheckerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest PasswordChecker

  test "12345 is very weak" do
    checker = fn -> PasswordChecker.CLI.main(["12345"]) end
    assert capture_io([], checker) == "The password '12345' is a very weak password.\n"
  end

  test "abcdef is weak" do
    checker = fn -> PasswordChecker.CLI.main(["abcdef"]) end
    assert capture_io([], checker) == "The password 'abcdef' is a weak password.\n"
  end

  test "abc123xyz is strong" do
    checker = fn -> PasswordChecker.CLI.main(["abc123xyz"]) end
    assert capture_io([], checker) == "The password 'abc123xyz' is a strong password.\n"
  end

  test "1337h@xor! is strong" do
    checker = fn -> PasswordChecker.CLI.main(["1337h@xor!"]) end
    assert capture_io([], checker) == "The password '1337h@xor!' is a very strong password.\n"
  end
end
