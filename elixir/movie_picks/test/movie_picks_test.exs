defmodule MoviePicksTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest MoviePicks

  test "displays a movie with a good score" do
    movie_picks = fn -> MoviePicks.CLI.main([FakeHttpClient]) end
    assert capture_io([input: "goodmovie\n"], movie_picks) ==
    """
    Enter the name of a movie: Title: title
    Year: 1968
    Rating: rated
    Running Time: running time
    Description: plot

    You should watch this movie right now!
    """
  end

  test "displays a movie with a bad score" do
    movie_picks = fn -> MoviePicks.CLI.main([FakeHttpClient]) end
    assert capture_io([input: "badmovie\n"], movie_picks) ==
    """
    Enter the name of a movie: Title: title
    Year: 1968
    Rating: rated
    Running Time: running time
    Description: plot

    Avoid at all costs!
    """
  end

  test "displays a movie with an OK score" do
    movie_picks = fn -> MoviePicks.CLI.main([FakeHttpClient]) end
    assert capture_io([input: "okmovie\n"], movie_picks) ==
    """
    Enter the name of a movie: Title: title
    Year: 1968
    Rating: rated
    Running Time: running time
    Description: plot

    """
  end
end

defmodule FakeHttpClient do
  def start do
  end

  def get("http://www.omdbapi.com/?t=goodmovie") do
    %{body: movie_data(86)}
  end

  def get("http://www.omdbapi.com/?t=badmovie") do
    %{body: movie_data(49)}
  end

  def get("http://www.omdbapi.com/?t=okmovie") do
    %{body: movie_data(50)}
  end

  defp movie_data(score) do
    """
    {
      "Title": "title",
      "Released": "1968",
      "Rated": "rated",
      "Runtime": "running time",
      "Plot": "plot",
      "Metascore": "#{score}"
    }
    """
  end
end
