defmodule BacCalculator do
  defmodule CLI do
    def main(_args) do
      {weight, _} = IO.gets("Weight in pounds? ") |> String.strip |> Integer.parse |> check_numeric
      gender = IO.gets("Gender? ") |> String.strip
      {number_of_drinks, _} = IO.gets("Number of drinks? ") |> String.strip |> Integer.parse |> check_numeric
      {alcohol_content, _} = IO.gets("Alcohol content in ounces? ") |> String.strip |> Float.parse |> check_numeric
      {hours_since_last_drink, _} = IO.gets("Hours since last drink? ") |> String.strip |> Integer.parse |> check_numeric
      cond do
        bac(weight, gender, number_of_drinks, alcohol_content, hours_since_last_drink) >= 0.08 -> IO.puts("It is not legal for you to drive.")
        true -> IO.puts("It is legal for you to drive")
      end
    end

    def bac(weight, gender, number_of_drinks, alcohol_content, hours_since_last_drink) do
      distribution_ratio = if gender == "male", do: 0.73, else: 0.66
      ((alcohol_content * number_of_drinks) * 5.14) / (weight * distribution_ratio) - (0.015 * hours_since_last_drink)
      |> Float.round(2)
    end

    defp check_numeric(input) do
      if input == :error do
        IO.puts("Numbers stupid")
        System.halt(0)
      end
      input
    end
  end
end
