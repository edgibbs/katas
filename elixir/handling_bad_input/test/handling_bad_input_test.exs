defmodule HandlingBadInputTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest HandlingBadInput

  test "the truth" do
    adding_numbers = fn -> HandlingBadInput.CLI.main(nil) end
    assert capture_io([input: "0\nABC\n4"], adding_numbers) ==
    """
    What is the rate of return? Sorry. That's not a valid input.
    What is the rate of return? Sorry. That's not a valid input.
    What is the rate of return? It will take 18 years to double your initial investment.
    """
  end
end
