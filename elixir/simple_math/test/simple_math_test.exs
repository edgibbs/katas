defmodule SimpleMathTest do
  use ExUnit.Case
  doctest SimpleMath

  test "does all the operations on two numbers" do
    expected_output =
    """
    10 + 5 = 15
    10 - 5 = 5
    10 * 5 = 50
    10 / 5 = 2
    """
    assert SimpleMath.CLI.process_operations(10, 5) == expected_output
  end
end
