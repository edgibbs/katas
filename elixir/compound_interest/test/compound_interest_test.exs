defmodule CompoundInterestTest do
  use ExUnit.Case
  doctest CompoundInterest

  test "the truth" do
    assert CompoundInterest.CLI.total(1500, 4.3, 6, 4) == 1938.84
  end
end
