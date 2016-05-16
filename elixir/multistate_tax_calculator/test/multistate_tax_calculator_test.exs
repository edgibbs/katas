defmodule MultistateTaxCalculatorTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest MultistateTaxCalculator

  defp multistate_tax_calculator do
    fn -> MultistateTaxCalculator.CLI.main(nil) end
  end

  test "charges correct tax in Wisconsin's Eau Claire county" do
    assert capture_io([input: "10\nWisconsin\nEau Claire"], multistate_tax_calculator) ==
    """
    What is the order amount? What state do you live in? What county do you live in? Your tax is $0.55.
   The total is $10.55.
    """
  end

  test "charges correct tax in Wisconsin's Dunn county" do
    assert capture_io([input: "10\nWisconsin\nDunn"], multistate_tax_calculator) ==
    """
    What is the order amount? What state do you live in? What county do you live in? Your tax is $0.54.
   The total is $10.54.
    """
  end

  test "charges correct tax in Wisconsin's for any other county" do
    assert capture_io([input: "10\nWisconsin\nClark"], multistate_tax_calculator) ==
    """
    What is the order amount? What state do you live in? What county do you live in? Your tax is $0.50.
   The total is $10.50.
    """
  end

  test "charges 8% for Illinois" do
    assert capture_io([input: "10\nIllinois"], multistate_tax_calculator) ==
    """
    What is the order amount? What state do you live in? Your tax is $0.80.
   The total is $10.80.
    """
  end

  test "charges no tax for any other state" do
    assert capture_io([input: "10\nNorth Dakota"], multistate_tax_calculator) ==
    """
    What is the order amount? What state do you live in? Your tax is $0.00.
   The total is $10.00.
    """
  end
end
