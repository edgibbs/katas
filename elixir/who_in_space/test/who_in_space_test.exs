defmodule WhoInSpaceTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WhoInSpace

  test "the truth" do
    who_in_space = fn -> WhoInSpace.CLI.main([FakeHttpClient]) end
    assert capture_io([input: ""], who_in_space) ==
    """
    Name                | Craft
    --------------------|------
    Hila Yehuda         | ISS
    Ivan Terrible       | ISS
    """
  end
end

defmodule FakeHttpClient do
  def start do
  end

  def get(url) do
    %{body: people}
  end

  defp people do
    """
    {
    "people":
      [ { "name": "Hila Yehuda", "craft": "ISS" },
        { "name": "Ivan Terrible", "craft": "ISS" }
        ]
    }
    """
  end
end
