defmodule MultistateTaxCalculator do
  defmodule CLI do
    def main(_args) do
      {amount, _} = IO.gets("What is the order amount? ") |> String.strip |> Float.parse
      state = IO.gets("What state do you live in? ") |> String.strip
      couny = nil
      if state == "Wisconsin" do
        county = IO.gets("What county do you live in? ") |> String.strip
        print_result(amount, state, county)
      end
    end

    defp print_result(amount, state, county) do
      tax = calculate_tax(amount, state, county)
      IO.puts "Your tax is $#{tax}."
      IO.puts "The total is $#{amount + tax}."
    end

    defp calculate_tax(amount, state, county) do
      if state == "Wisconsin" do
        case county do
          "Eau Claire" -> amount * 0.055 |> Float.round(2)
          true -> amount * 0.05 |> Float.round(2)
        end
      end
    end
  end
end
