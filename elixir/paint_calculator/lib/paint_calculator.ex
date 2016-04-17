defmodule PaintCalculator do
  defmodule CLI do
    @square_feet_per_gallon 350

    def main(_args) do
      {length, _} = IO.gets("What is the length of room in feet? ") |> String.strip |> Integer.parse
      {width, _} = IO.gets("What is the width of room in feet? ") |> String.strip |> Integer.parse
      IO.puts output_result(length, width)
    end

    def cans_of_paint(length, width) do
       area_in_feet(length, width)
       |> div(@square_feet_per_gallon)
       |> + add_extra_can(area_in_feet(length, width))
    end

    defp area_in_feet(length, width) do
      length * width
    end

    defp add_extra_can(area) do
      cond do
        rem(area, @square_feet_per_gallon) > 0 -> 1
        true -> 0
      end
    end

    defp output_result(length, width) do
      "You will need to purchase #{cans_of_paint(length, width)} gallons of paint to cover #{area_in_feet(length, width)} square feet."
    end
  end
end
