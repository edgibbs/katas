defmodule ProductSearch do

  defmodule CLI do
    @derive [Poison.Encoder]

    def main(_args) do
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
  end
end
