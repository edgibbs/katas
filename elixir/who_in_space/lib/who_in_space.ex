defmodule WhoInSpace do
  defmodule CLI do
    def main(args) do
      http_client = List.first(args) || HTTPotion
      http_client.start
      response = http_client.get("http://api.open-notify.org/astros.json")
      json_result = Poison.Parser.parse!(response.body)
      IO.puts "Name                | Craft"
      IO.puts "--------------------|------"
      astronauts = Enum.map(json_result["people"], fn(person) ->
        %{name: person["name"], craft: person["craft"]}
      end)
      Enum.map(astronauts, fn(astronaut) ->
        IO.puts "#{String.ljust(astronaut.name, 19)} | #{astronaut.craft}"
      end)
    end
  end
end
