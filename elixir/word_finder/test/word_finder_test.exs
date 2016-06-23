defmodule WordFinderTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WordFinder

  setup do
    on_exit fn ->
      File.rm("result.txt")
    end
  end

  test "writes a replace file" do
    word_finder = fn -> WordFinder.CLI.main(nil) end
    assert capture_io([input: "result.txt\n"], word_finder) ==
    "What do you want the file name to be? "
    assert File.read!("result.txt") ==
    "One should never use the word \"use\" in writing. Use \"use\" instead.\n"
  end
end
