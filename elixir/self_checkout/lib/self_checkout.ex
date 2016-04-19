defmodule SelfCheckout do
  defmodule CLI do
    @tax_rate 0.055
    def main(_args) do

    end

    def calculate_receipt(item1, item2, item3) do
      subtotal = List.first(item1) * List.last(item1)
       |> + (List.first(item2) * List.last(item2))
       |> + (List.first(item3) * List.last(item3))
       tax = Float.round(subtotal * @tax_rate, 2)
      [subtotal, tax, subtotal + tax]
    end
  end
end
