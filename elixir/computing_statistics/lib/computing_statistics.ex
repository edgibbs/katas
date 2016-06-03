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
      IO.puts("Numbers: #{Enum.join(numbers, ", ")}")
      IO.puts("The average is #{average(numbers)}.")
      IO.puts("The minimum is #{Enum.min(numbers)}.")
      IO.puts("The maximum is #{Enum.max(numbers)}.")
      IO.puts("The standard deviation is #{standard_deviation(numbers)}.")
    end

    defp ask_for_number(number, numbers) do
      numbers = List.insert_at(numbers, -1, Integer.parse(number) |> elem(0))
      new_number = IO.gets("Enter a number: ") |> String.rstrip
      ask_for_number(new_number, numbers)
    end

    defp average(numbers) do
      (Enum.sum(numbers) / Enum.count(numbers)) |> round
    end

    defp standard_deviation(numbers) do
      count = Enum.count(numbers)
      sum = Enum.sum(numbers)
      sum_of_squares = Enum.reduce(numbers, 0, fn(number, accumulator) -> number * number + accumulator end)
      difference = (count * sum_of_squares) - (sum * sum) |> abs
      denominator = count * (count - 1)
      :math.sqrt(difference / denominator) |> Float.round(2)
    end
  end
end
