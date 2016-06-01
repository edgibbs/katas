defmodule PickAWinnerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest PickAWinner

  test "picks a winner" do
    pick_a_winner = fn -> PickAWinner.CLI.main(nil) end
    assert Regex.match?(~r/^Enter a name: Enter a name: Enter a name: Enter a name: Enter a name: Enter a name: /, capture_io([input: "Homer\nBart\nMaggie\nLisa\nMoe\n\n"], pick_a_winner))
    assert Regex.match?(~r/The winner is\.\.\. (Homer|Bart|Maggie|Lisa|Moe)\./, capture_io([input: "Homer\nBart\nMaggie\nLisa\nMoe\n\n"], pick_a_winner))
  end
end
