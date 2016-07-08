defmodule MoviePicks do
  require Logger

  defmodule CLI do
    def main(args) do
      movie_name = IO.gets("Enter the name of a movie: ") |> String.strip
      Logger.info "stuff"
      fetch_movie(args, movie_name)
        |> Poison.Parser.parse!
        |> print_results(movie_name)
    end

    defp fetch_movie(args, movie_name) do
      http_client = List.first(args) || HTTPotion
      http_client.start
      x = http_client.get("http://www.omdbapi.com/?t=#{movie_name}").body
      Logger.info x
      x
    end

    defp print_results(movie, movie_name) do
    end
  end
end
