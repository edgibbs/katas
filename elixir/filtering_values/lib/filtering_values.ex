defmodule FilteringValues do
  defmodule CLI do
    def main(_args) do
      even_numbers = IO.gets("Enter a list of numbers, separated by spaces: ")
                |> String.strip
                |> String.split
                |> Enum.map(fn(x) -> Integer.parse(x) |> elem(0) end)
                |> find_even_numbers([])
      IO.puts "The even numbers are #{Enum.join(even_numbers, " ")}."
    end

    defp find_even_numbers([], even_numbers) do
      even_numbers
    end

    defp find_even_numbers([head|tail], even_numbers) when rem(head, 2) == 0 do
      find_even_numbers(tail, even_numbers ++ [head])
    end

    defp find_even_numbers([head|tail], even_numbers) do
      find_even_numbers(tail, even_numbers)
    end
  end
end
