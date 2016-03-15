defmodule SimpleMath do
  defmodule CLI do
    def main(_args) do
      first = IO.gets("What is the first number? ") |> String.strip |> String.to_integer
      second = IO.gets("What is the second number? ") |> String.strip |> String.to_integer
      IO.puts process_operations(first, second)
    end

    def process_operations(first, second) do
      """
      #{first} + #{second} = #{first + second}
      #{first} - #{second} = #{first - second}
      #{first} * #{second} = #{first * second}
      #{first} / #{second} = #{div(first, second)}
      """
    end
  end
end
