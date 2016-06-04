defmodule PasswordGeneratorTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest PasswordGenerator

  test "generates random password" do
    password_generator = fn -> PasswordGenerator.CLI.main(nil) end
    assert capture_io([input: "8\n2\n2"], password_generator) ==
    "What's the minimum length: How many special characters? How many numbers? "
  end
end
