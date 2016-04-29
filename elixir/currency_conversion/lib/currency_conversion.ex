defmodule CurrencyConversion do
  defmodule CLI do
    def main(_args) do
      {euros, _} = IO.gets("How many euros are you exchanging? ") |> String.strip |> Float.parse
      {exchange_rate, _} = IO.gets("What is the exchange rate? ") |> String.strip |> Float.parse
      dollars = dollars_to_euros(euros, exchange_rate)
      IO.puts print_result(euros, exchange_rate, dollars)
    end

    def dollars_to_euros(euros, exchange_rate) do
      euros * (exchange_rate / 100) |> Float.round(2)
    end

    defp print_result(euros, exchange_rate, dollars) do
      """
      #{euros} euros at the exchange_rate of #{exchange_rate} is #{dollars} U.S. dollars.
      """
    end
  end
end
