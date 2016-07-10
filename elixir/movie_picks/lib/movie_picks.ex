defmodule MoviePicks do
  require Logger

  defmodule CLI do
    def main(args) do
      movie_name = IO.gets("Enter the name of a movie: ") |> String.strip
      fetch_movie(args, movie_name)
        |> Poison.Parser.parse!
        |> print_results(movie_name)
    end

    defp fetch_movie(args, movie_name) do
      http_client = List.first(args) || HTTPotion
      http_client.start
      http_client.get("http://www.omdbapi.com/?t=#{movie_name}").body
    end

    defp print_results(movie, movie_name) do
      IO.puts """
      Title: #{movie["Title"]}
      Year: #{String.slice(movie["Released"], -4..-1)}
      Rating: #{movie["Rated"]}
      Running Time: #{movie["Runtime"]}
      Description: #{movie["Plot"]}
      """
      print_recomendation(movie)
    end

    defp print_recomendation(movie) do
      cond do
        String.to_integer(movie["Metascore"]) > 80 ->
          IO.puts "You should watch this movie right now!"
        String.to_integer(movie["Metascore"]) < 50 ->
          IO.puts "Avoid at all costs!"
        true -> 0 #noop
      end
    end
  end
end
