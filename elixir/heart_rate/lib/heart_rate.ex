defmodule HeartRate do
  defmodule CLI do
    def main(_args) do
      age = ask_age
      heart_rate = ask_heart_rate
      print_header
    end

    defp ask_age do
      age = IO.gets("What is your age? ") |> String.strip
      if Integer.parse(age) == :error do
        ask_age
      end
      {real_age, _} = Integer.parse(age)
      real_age
    end

    defp ask_heart_rate do
      heart_rate = IO.gets("What is your resting heart rate? ") |> String.strip
      if Integer.parse(heart_rate) == :error do
        ask_heart_rate
      end
      {real_heart_rate, _} = Integer.parse(heart_rate)
      heart_rate
    end

    defp print_header do
      IO.puts """

      Intensity    | Rate
      -------------|-----
      """
    end
  end
end
