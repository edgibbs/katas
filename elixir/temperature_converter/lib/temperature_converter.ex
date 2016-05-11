defmodule TemperatureConverter do
  defmodule CLI do
    def main(_args) do
      IO.puts(intro_text)
      choice = IO.gets("Your choice: ") |> String.strip
      convert(choice)
    end

    defp convert("C") do
      {degrees_fahrenheit, _} = IO.gets("Please enter the temperature in Fahrenheit: ") |> String.strip |> Integer.parse
      degrees_celcius = (degrees_fahrenheit - 32) * (5 / 9) |> round
      IO.puts "The temperature in Celcius is #{degrees_celcius}"
    end

    defp convert("F") do
      {degrees_celcius, _} = IO.gets("Please enter the temperature in Celcius: ") |> String.strip |> Integer.parse
      degrees_fahrenheit = (degrees_celcius * (9 / 5)) + 32 |> round
      IO.puts "The temperature in Fahrenheit is #{degrees_fahrenheit}"
    end

    defp intro_text do
      """
      Press C to convert from Fahrenheit to Celcius.
      Press F to covert from Celsius to Fahrenheit.
      """
    end
  end
end
