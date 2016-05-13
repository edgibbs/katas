defmodule BmiCalculator do
  defmodule CLI do
    def main(_args) do
      {weight, _} = IO.gets("Your weight in pounds: ") |> String.strip |> Integer.parse
      {height, _} = IO.gets("Your height in inches: ") |> String.strip |> Integer.parse

      case calculate(weight, height) do
        bmi when bmi < 18.5 -> IO.puts "Your BMI is #{bmi}.\nYou are underweight. You should see your doctor."
        bmi when bmi > 25.0 -> IO.puts "Your BMI is #{bmi}.\nYou are overweight. You should see your doctor."
        bmi -> IO.puts "Your BMI is #{bmi}.\nYou are within the ideal weight range."
      end
    end

    defp calculate(weight, height) do
      (weight / (height * height)) * 703 |> Float.round(1)
    end
  end
end
