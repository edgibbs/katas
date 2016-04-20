defmodule SelfCheckout do
  defmodule CLI do
    @tax_rate 0.055
    def main(_args) do
      {item1_price, _} = IO.gets("Enter the price of item 1: ") |> String.strip |> Float.parse
      {item1_quantity, _} = IO.gets("Enter the quantity of item 1: ") |> String.strip |> Float.parse
      {item2_price, _} = IO.gets("Enter the price of item 2: ") |> String.strip |> Float.parse
      {item2_quantity, _} = IO.gets("Enter the quantity of item 2: ") |> String.strip |> Float.parse
      {item3_price, _} = IO.gets("Enter the price of item 3: ") |> String.strip |> Float.parse
      {item3_quantity, _} = IO.gets("Enter the quantity of item 3: ") |> String.strip |> Float.parse
      {subtotal, tax, total} = calculate_receipt([item1_price, item1_quantity], [item2_price, item2_quantity], [item3_price, item3_quantity])
      IO.puts print_receipt(subtotal, tax, total)
    end

    def calculate_receipt(item1, item2, item3) do
      subtotal = List.first(item1) * List.last(item1)
       |> + (List.first(item2) * List.last(item2))
       |> + (List.first(item3) * List.last(item3))
       tax = Float.round(subtotal * @tax_rate, 2)
       {subtotal, tax, subtotal + tax}
    end

    defp print_receipt(subtotal, tax, total) do
      """
      Subtotal: $#{Float.to_string(subtotal, [decimals: 2])}
      Tax: $#{Float.to_string(tax, [decimals: 2])}
      Total: $#{Float.to_string(total, [decimals: 2])}
      """
    end
  end
end
