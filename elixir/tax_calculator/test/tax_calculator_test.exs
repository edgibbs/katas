defmodule TaxCalculatorTest do
  use ExUnit.Case
  doctest TaxCalculator

  test "WI has sales tax" do
    assert TaxCalculator.CLI.tax("WI", 10.0) == """
    The subtotal is $10.00.
    The tax is $0.55.
    The total is $10.55.
    """
  end

  test "Other states have no sales tax" do
    assert TaxCalculator.CLI.tax("MN", 10.0) == "The total is $10.00"
  end
end
