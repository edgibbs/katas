defmodule NumbersToNames do
  defmodule CLI do
    def main(_args) do
      {month, _} = IO.gets("Please enter the number of the month: ") |> String.strip |> Integer.parse
      case month do
        1 -> print("January")
        2 -> print("February")
        3 -> print("March")
        4 -> print("April")
        5 -> print("May")
        6 -> print("June")
        7 -> print("July")
        8 -> print("August")
        9 -> print("September")
        10 -> print("October")
        11 -> print("November")
        12 -> print("December")
        _ -> IO.puts "There is no such month."
      end
    end

    defp print(month) do
      IO.puts "The name of the month is #{month}."
    end
  end
end
