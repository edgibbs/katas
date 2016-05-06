defmodule CompoundInterest do
  defmodule CLI do
    def main(_args) do
      {principal, _} = IO.gets("What is the principal? ") |> String.strip |> Float.parse
      {interest_rate, _} = IO.gets("What is the rate? ") |> String.strip |> Float.parse
      {years, _} = IO.gets("What is the number of years? ") |> String.strip |> Integer.parse
      {compounded_times_per_year, _} = IO.gets("What is the number of times the interest is compounded per year? ") |> String.strip |> Integer.parse
      IO.puts print_result(principal, interest_rate, years, compounded_times_per_year)
    end

    def total(principal, interest_rate, years, compounded_times_per_year) do
      principal * :math.pow((1 + (interest_rate / 100) / compounded_times_per_year), compounded_times_per_year * years)
      |> Float.round(2)
    end

    defp print_result(principal, interest_rate, years, compounded_times_per_year) do
      total = total(principal, interest_rate, years, compounded_times_per_year)
      """
      #{format_currency(principal)} invested at #{interest_rate}% for #{years} years
      compounded #{compounded_times_per_year} times per year is #{format_currency(total)}."
      """
    end

    def format_currency(number) do
      "$" <> (:io_lib.format("~.*f", [2, number]) |> List.first |> to_string)
    end
  end
end
