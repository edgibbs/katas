defmodule MoviePicksTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest MoviePicks

  test "displays a movie type" do
    # movie_picks = fn -> MoviePicks.CLI.main([FakeHttpClient]) end
    movie_picks = fn -> MoviePicks.CLI.main([nil]) end
    assert capture_io([input: "2001\n"], movie_picks) ==
    """
    Enter the name of a movie: 
    Title: 
    Year:
    Rating:
    """
  end
end

defmodule FakeHttpClient do
  def start do
  end

  def get(_url) do
    %{body: weather_data}
  end

  defp weather_data do
    """
    {
    "main":
      {
        "temp": 291.5
      }
    }
    """
  end
end
