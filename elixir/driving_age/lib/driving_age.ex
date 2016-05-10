defmodule DrivingAge do
  defmodule CLI do
    def main(_args) do
      {age, _}  = IO.gets("What is your age? ") |> String.strip |> Integer.parse
      message = if age >= 16, do: "You are old enough to legally drive.", else: "You are not old enough to legally drive."
      IO.puts message
    end
  end
end
