defmodule WhoInSpaceTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WhoInSpace

  test "the truth" do
    who_in_space = fn -> WhoInSpace.CLI.main(nil) end
    assert capture_io([input: ""], who_in_space) ==
    """
    Name                | Craft
    --------------------|------
    Gennady Padalka     | ISS
    Mikhail Kornienko   | ISS
    Scott Kelly         | ISS
    """
  end
end
