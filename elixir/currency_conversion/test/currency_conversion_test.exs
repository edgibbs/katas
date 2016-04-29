defmodule CurrencyConversionTest do
  use ExUnit.Case
  doctest CurrencyConversion

  test "can convert to from dollars to euros" do
    assert CurrencyConversion.CLI.dollars_to_euros(81, 137.51) == 111.38
  end
end
