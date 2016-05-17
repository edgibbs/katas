defmodule ComparingNumbersTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ComparingNumbers

  def comparing_numbers  do
    fn -> ComparingNumbers.CLI.main(nil) end
  end

  test "shows the largest number" do
    assert capture_io([input: "1\n51\n2"], comparing_numbers) ==
    """
    Enter the first number: Enter the second number: Enter the third number: The largest number is 51.
    """
  end

  @tag :pending
  test "exits if they aren't all differnt" do
    assert capture_io([input: "1\n1\n1"], comparing_numbers) ==
    """
    Enter the first number: Enter the second number: Enter the third number: halted
    The largest number is 1.
    """
  end
end
