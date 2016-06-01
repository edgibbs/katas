defmodule PickAWinner do
  defmodule CLI do
    def main(_args) do
      ask_for_name(nil, [])
    end

    defp ask_for_name(nil, names) do
      new_name = IO.gets("Enter a name: ") |> String.rstrip
      ask_for_name(new_name, names)
    end

    defp ask_for_name("", names) do
      Enum.random(names)
      IO.puts "The winner is... #{Enum.random(names)}."
    end

    defp ask_for_name(name, names) do
      names = List.insert_at(names, -1, name)
      new_name = IO.gets("Enter a name: ") |> String.rstrip
      ask_for_name(new_name, names)
    end
  end
end
