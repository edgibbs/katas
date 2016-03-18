defmodule RetirementCalculatorTest do
  use ExUnit.Case
  doctest RetirementCalculator

  test "calculate your retirement year" do
    {{current_year, _, _}, {_,_,_}} = :calendar.now_to_local_time(:erlang.timestamp)
    expected_output =
    """
    You have 40 years left until retirement.
    It's #{current_year}, so you can retire in #{current_year + 40}.
    """
    assert RetirementCalculator.CLI.retirement_statement(25, 65) == expected_output
  end
end
