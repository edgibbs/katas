defmodule SelfCheckoutTest do
  use ExUnit.Case
  doctest SelfCheckout

  test "prints a proper receipt" do
    assert SelfCheckout.CLI.calculate_receipt([25, 2], [10, 1], [4, 1]) == {64.0, 3.52, 67.52}
  end
end
