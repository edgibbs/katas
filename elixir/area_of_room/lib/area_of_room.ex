defmodule AreaOfRoom do
  defmodule CLI do

    @feet_in_meter 0.09290304

    def main(_args) do
      {length, _} = IO.gets("What is the length of room in feet? ") |> String.strip |> Float.parse
      {width, _} = IO.gets("What is the width of room in feet? ") |> String.strip |> Float.parse
      IO.puts output_result(length, width)
    end

    def area_in_feet(length, width) do
      length * width
    end

    def area_in_meters(area_in_feet) do
      area_in_feet * @feet_in_meter |> Float.round(3)
    end

    defp output_result(length, width) do
      feet_area = area_in_feet(length, width)
      meter_area = area_in_meters(feet_area)
      """
      The area is
      #{feet_area} square feet
      #{meter_area} square meters
      """
    end
  end
end
