defmodule BacCalculatorTest do
  use ExUnit.Case
  doctest BacCalculator

  test "calculates blood alchol level" do
    weight = 200
    gender = "male"
    number_of_drinks = 4
    alcohol_content = 0.6
    hours_since_last_drink = 0
    assert BacCalculator.CLI.bac(weight, gender, number_of_drinks, alcohol_content, hours_since_last_drink) == 0.08
  end
end
