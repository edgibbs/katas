defmodule MultistateTaxCalculatorTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest MultistateTaxCalculator

  defp multistate_tax_calculator do
    fn -> MultistateTaxCalculator.CLI.main(nil) end
  end

  test "charges correct tax in Wisconsin's Eau Claire count" do
    assert capture_io([input: "10\nWisconsin\nEau Claire"], multistate_tax_calculator) ==
    """
    What is the order amount? What state do you live in? What county do you live in? Your tax is $0.55.
   The total is $10.55.
    """
  end
end
