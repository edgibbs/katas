defmodule MultiplicationTableTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest MultiplicationTable

  test "builds multiplication tables" do
    multiplication_table = fn -> MultiplicationTable.CLI.main(nil) end
    assert Regex.match?(~r/0 X 0/, capture_io([input: ""], multiplication_table))
    assert Regex.match?(~r/12 X 12 = 144/, capture_io([input: ""], multiplication_table))
    assert Regex.match?(~r/6 X 6 = 36/, capture_io([input: ""], multiplication_table))
    assert Regex.match?(~r/6 X 0 = 0/, capture_io([input: ""], multiplication_table))
  end
end
