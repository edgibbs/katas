defmodule FilteringValuesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest FilteringValues

  test "picks out even numbers" do
    filtering_values = fn -> FilteringValues.CLI.main(nil) end
    assert capture_io([input: "1 2 3 4 5 6 7 8\n"], filtering_values) ==
    """
    Enter a list of numbers, separated by spaces: The even numbers are 2 4 6 8.
    """
  end
end
