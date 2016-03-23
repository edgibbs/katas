defmodule PizzaPartyTest do
  use ExUnit.Case
  doctest PizzaParty

  test "divvy up pizzas exactly" do
    {slices_per, remainder} = PizzaParty.CLI.slices_per_and_remainder(8, 8, 2)
    assert slices_per == 2
    assert remainder == 0
  end

  test "divvy up pizzas with leftovers" do
    {slices_per, remainder} = PizzaParty.CLI.slices_per_and_remainder(9, 8, 2)
    assert slices_per == 1
    assert remainder == 7
  end
end
