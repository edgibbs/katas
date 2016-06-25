defmodule WordFrequencyTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WordFrequency

  test "prints out sorted word frequency" do
    word_frequency = fn -> WordFrequency.CLI.main(nil) end
    assert capture_io([input: ""], word_frequency) ==
    """
    badger: *******
    mushroom: **
    snake: *
    """
  end
end
