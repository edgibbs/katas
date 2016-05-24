defmodule AddingNumbers do
  defmodule CLI do
    def main(_args) do
      IO.puts "The total is #{Enum.sum(ask_for_numbers)}."
    end

    defp ask_for_numbers do
      for ask <- 1..5 do
        IO.gets("Enter a number: ") |> String.strip |> String.to_integer
      end
    end
  end
end
