defmodule ProductSearch do
  defmodule CLI do
    @derive [Poison.Encoder]

    def main(_args) do
      ask_for_product
    end

    defp ask_for_product do
      product_name = IO.gets("What is the product name? ") |> String.strip
      product = search_product(product_name)
      case product do
        nil -> ask_for_product
        _ -> print_product(product)
      end
    end

    defp search_product(product_name) do
      {:ok, products} = Poison.decode(products)
      result = Enum.find(products["products"], fn(product) -> product["name"] == product_name end)
    end

    defp print_product(product) do
      IO.puts "Name: #{product["name"]}"
      IO.puts "Price: #{format_currency(product["price"])}"
      IO.puts "Quantity on hand: #{product["quantity"]}"
    end

    defp products do
      ~s({ "products":
        [
          { "name": "Widget", "price": 25.00, "quantity": 5 },
          { "name": "Thing", "price": 15.00, "quantity": 5 },
          { "name": "Doodad", "price": 5.00, "quantity": 10 }
        ]
      })
    end

    defp format_currency(number) do
      "$" <> (:io_lib.format("~.*f", [2, number]) |> List.first |> to_string)
    end
  end
end
