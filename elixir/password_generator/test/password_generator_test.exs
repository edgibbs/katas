defmodule PasswordGeneratorTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest PasswordGenerator

  test "generates random password prompts and output" do
    password_generator = fn -> PasswordGenerator.CLI.main(nil) end
    assert Regex.match?(~r/What's the minimum length: How many special characters\? How many numbers\? Your password is/, capture_io([input: "8\n2\n2"], password_generator))
  end

  test "generates a random password" do
    password = PasswordGenerator.CLI.random_password(8, 3, 2)
    assert String.length(password) == 8
    assert String.codepoints(password) |> Enum.reject(fn(x) -> !String.match?(x, ~r/\d/) end) |> Enum.count == 2
    assert String.codepoints(password) |> Enum.reject(fn(x) -> String.match?(x, ~r/([a-z]|[A-Z]|\d)/) end) |> Enum.count == 3
  end
end
