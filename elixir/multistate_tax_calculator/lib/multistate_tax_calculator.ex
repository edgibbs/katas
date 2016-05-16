defmodule MultistateTaxCalculator do
  defmodule CLI do
    require IEx

    def main(_args) do
      {amount, _} = IO.gets("What is the order amount? ") |> String.strip |> Float.parse
      state = IO.gets("What state do you live in? ") |> String.strip
      county = nil
      if state == "Wisconsin" do
        county = IO.gets("What county do you live in? ") |> String.strip
      end
      print_result(amount, state, county)
    end

    defp print_result(amount, state, county) do
      tax = calculate_tax(amount, state, county)
      IO.puts "Your tax is #{format_currency(tax)}."
      IO.puts "The total is #{format_currency(amount + tax)}."
    end

    defp calculate_tax(amount, state, county) do
      case state do
        "Wisconsin" ->
          case county do
            "Eau Claire" -> amount * 0.055 |> Float.round(2)
            "Dunn" -> amount * 0.054 |> Float.round(2)
            _ -> amount * 0.05 |> Float.round(2)
          end
        "Illinois" -> amount * 0.08 |> Float.round(2)
        _ -> 0.0
      end
    end

    defp format_currency(number) do
      "$" <> (:io_lib.format("~.*f", [2, number]) |> List.first |> to_string)
    end
  end
end
