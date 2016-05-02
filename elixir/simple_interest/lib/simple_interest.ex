defmodule SimpleInterest do
  defmodule CLI do
    def main(_args) do
      {principal, _} = IO.gets("Enter the principal: ") |> String.strip |> Float.parse
      {interest_rate, _} = IO.gets("Enter the rate of interest: ") |> String.strip |> Float.parse
      {years, _} = IO.gets("Enter the number of years: ") |> String.strip |> Float.parse
      IO.puts print_result(principal, interest_rate, years)
    end

    def total(principal, interest_rate, years) do
      principal + (principal * (interest_rate / 100)) * years |> Float.round(2)
    end

    def format_currency(number) do
      "$" <> (:io_lib.format("~.*f", [2, number]) |> List.first |> to_string)
    end

    defp print_result(principal, interest_rate, years) do
      """
      After #{years} at #{interest_rate}%, the investment will be worth #{total(principal, interest_rate, years) |> format_currency}"
      """
    end
  end
end
