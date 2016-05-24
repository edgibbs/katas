defmodule AddingNumbersTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest AddingNumbers

  test "prompts and sums 5 numbers" do
    adding_numbers = fn -> AddingNumbers.CLI.main(nil) end
    assert capture_io([input: "1\n2\n3\n4\n5"], adding_numbers) ==
    """
    Enter a number: Enter a number: Enter a number: Enter a number: Enter a number: The total is 15.
    """
  end
end
