defmodule PizzaPartyTest do
  use ExUnit.Case
  doctest PizzaParty

  test "divvy up pizzas exactly" do
    {slices_per, remainder} = PizzaParty.CLI.slices_per_and_remainder(8, 8, 2)
    assert slices_per == 2
    assert remainder == 0
  end

  test "divvy up pizzas with leftovers" do
    {slices_per, remainder} = PizzaParty.CLI.slices_per_and_remainder(2, 5, 1)
    assert slices_per == 2
    assert remainder == 1
  end
end
