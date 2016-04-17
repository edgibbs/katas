defmodule PaintCalculatorTest do
  use ExUnit.Case
  doctest PaintCalculator

  test "takes 2 gallons of paint to cover 360 square feet" do
    assert PaintCalculator.CLI.cans_of_paint(60, 6) == 2
  end

  test "takes 1 gallon of paint to cover 350 square feet" do
    assert PaintCalculator.CLI.cans_of_paint(175, 2) == 1
  end
end
