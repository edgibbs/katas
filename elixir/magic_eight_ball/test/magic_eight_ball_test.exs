defmodule MagicEightBallTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest MagicEightBall

  test "can ask the eight ball for an answer 2" do
    magic_eight_ball = fn -> MagicEightBall.CLI.main(nil) end
    assert Regex.match?(~r/^What's your question?/, assert capture_io([import: ""], magic_eight_ball))
    assert Regex.match?(~r/(Yes\.|No\.|Maybe\.|Ask again later\.)$/, assert capture_io([import: ""], magic_eight_ball))
  end
end
