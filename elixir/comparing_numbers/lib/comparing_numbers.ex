defmodule ComparingNumbers do
  defmodule CLI do
    def main(_args) do
      {first, _} = IO.gets("Enter the first number: ") |> String.strip |> Integer.parse
      {second, _} = IO.gets("Enter the second number: ") |> String.strip |> Integer.parse
      {third, _} = IO.gets("Enter the third number: ") |> String.strip |> Integer.parse
      same(first, second, third)
      IO.puts "The largest number is #{largest(first, second, third)}."
    end

    defp same(first, second, third) do
      if first == second || first == third || second == third do
        System.halt(0)
      end
    end

    defp largest(first, second, third) do
      top = first
      if second > top do
        top = second
      end
      if third > top do
        top = third
      end
      top
    end
  end
end
