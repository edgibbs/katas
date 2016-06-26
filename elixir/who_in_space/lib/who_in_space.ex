defmodule WhoInSpace do
  defmodule CLI do
    def main(_args) do
      HTTPotion.start
      response = HTTPotion.get "http://api.open-notify.org/astros.json"
      json_result = Poison.Parser.parse!(response.body)
      IO.puts "Name                | Craft"
      IO.puts "--------------------|------"
      astronauts = Enum.map(json_result["people"], fn(person) ->
        %{name: person["name"], craft: person["craft"]}
      end)
      longest_name = Enum.map(astronauts, fn(astronaut) -> String.length(astronaut.name) end) |> Enum.max
      Enum.map(astronauts, fn(astronaut) ->
        IO.puts "#{String.ljust(astronaut.name, longest_name)} | #{astronaut.craft}"
      end)
    end
  end
end
