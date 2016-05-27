defmodule HeartRate do
  defmodule CLI do
    def main(_args) do
      age = ask_age
      heart_rate = ask_heart_rate
      print_header
      print_rows(55, age, heart_rate)
    end

    defp ask_age do
      age = IO.gets("What is your age? ") |> String.strip
      if Integer.parse(age) == :error do
        ask_age
      else
        {real_age, _} = Integer.parse(age)
        real_age
      end
    end

    defp ask_heart_rate do
      heart_rate = IO.gets("What is your resting heart rate? ") |> String.strip
      if Integer.parse(heart_rate) == :error do
        ask_heart_rate
      else
        {real_heart_rate, _} = Integer.parse(heart_rate)
        real_heart_rate
      end
    end

    defp print_header do
      IO.puts "\nIntensity    | Rate\n-------------|--------"
    end

    defp print_rows(intensity, _age, _heart_rate) when intensity > 95 do
      IO.puts("")
    end

    defp print_rows(intensity, age, heart_rate) do
      IO.puts("#{intensity}%          | #{target_heart_rate(intensity, age, heart_rate)} bpm")
      print_rows(intensity + 5, age, heart_rate)
    end

    defp target_heart_rate(intesity, age, heart_rate) do
      ((220 - age) - heart_rate) * (intesity / 100) + heart_rate |> round
    end
  end
end
