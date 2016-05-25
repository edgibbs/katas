defmodule HandlingBadInput do
  defmodule CLI do
    def main(_args) do
      {rate, _} = IO.gets("What is the rate of return? ") |> String.strip |> Integer.parse
      how_long(rate)
    end

    defp how_long(rate) when is_integer(rate) and rate > 0 do
      IO.puts "It will take #{(72 / rate) |> round} years to double your initial investment."
    end

    defp how_long(rate) do
      IO.puts "Sorry. That's not a valid input."
      result = IO.gets("What is the rate of return? ") |> String.strip
      if Integer.parse(result) == :error do
        how_long(result)
      else
        {new_rate, _} = Integer.parse(result)
        how_long(new_rate)
      end
    end
  end
end
