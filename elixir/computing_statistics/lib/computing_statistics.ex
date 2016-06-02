defmodule ComputingStatistics do
  defmodule CLI do
    def main(_args) do
      ask_for_number(nil, [])
    end

    defp ask_for_number(nil, numbers) do
      new_number = IO.gets("Enter a number: ") |> String.rstrip
      ask_for_number(new_number, numbers)
    end

    defp ask_for_number("done", numbers) do
      IO.puts "Numbers: "
    end

    defp ask_for_number(number, numbers) do
      numbers = List.insert_at(numbers, -1, Integer.parse(number) |> elem(0))
      new_number = IO.gets("Enter a number: ") |> String.rstrip
      ask_for_number(new_number, numbers)
    end
  end
end
