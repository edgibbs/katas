defmodule CountCharactersTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest CountCharacters

  test "counts the number of chars in an input string" do
    count_characters = fn ->
      CountCharacters.CLI.main(nil)
    end

    assert capture_io([input: "Homer\n"], count_characters) == "What is the input string?Homer has 5 characters.\n"
  end
end
