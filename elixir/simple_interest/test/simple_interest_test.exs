defmodule SimpleInterestTest do
  use ExUnit.Case
  doctest SimpleInterest

  test "computes the simple interest total" do
    assert SimpleInterest.CLI.total(1500, 4.3, 4) == 1758
  end

  test "formats currency correctly" do
    assert SimpleInterest.CLI.format_currency(1758.0) == "$1758.00"
  end
end
