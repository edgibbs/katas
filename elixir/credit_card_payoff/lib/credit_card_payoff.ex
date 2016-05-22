defmodule CreditCardPayoff do
  require IEx
  defmodule CLI do
    def main(_args) do
      {balance, _} = IO.gets("What is your balance? ") |> String.strip |> Float.parse
      {apr, _} = IO.gets("What is the APR on the card (as a percent)? ") |> String.strip |> Integer.parse
      {monthly_payment, _} = IO.gets("What is the monthly payment you can make? ") |> String.strip |> Float.parse
      IO.puts "It will take you #{calculate_months_until_paid_off(balance, apr, monthly_payment)} months to pay off this card."
    end

    defp calculate_months_until_paid_off(balance, apr, monthly_payment) do
      monthly_apr = apr / 1200
      numerator = -1 * :math.log(1 - monthly_apr * (balance / monthly_payment ))
      denominator = :math.log(1 + monthly_apr)
      numerator / denominator |> round
    end
  end
end
