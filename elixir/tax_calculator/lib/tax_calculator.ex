defmodule TaxCalculator do
  defmodule CLI do
    def main(_args) do
      {amount, _} = IO.gets("What is the order amount? ") |> String.strip |> Float.parse
      state = IO.gets("What is the state? ") |> String.strip
      IO.puts print_result(amount, state)
    end

    def tax("WI", amount) do
      total_tax = amount * 0.055 |> Float.round(2)
      """
      The subtotal is #{format_currency(amount)}.
      The tax is #{format_currency(total_tax)}.
      The total is #{format_currency(amount + total_tax)}.
      """
    end

    def tax(_, amount) do
       "The total is #{format_currency(amount)}"
    end

    defp print_result(amount, state) do
      tax(state, amount)
    end

    defp format_currency(number) do
      "$" <> (:io_lib.format("~.*f", [2, number]) |> List.first |> to_string)
    end
  end
end
