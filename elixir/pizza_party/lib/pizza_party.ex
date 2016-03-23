defmodule PizzaParty do
  defmodule CLI do
    def main(_args) do
    end

    def slices_per_and_remainder(people, slices_per_pizza, number_of_pizzas) do
      total_slices = slices_per_pizza * number_of_pizzas
      slices_per_person = total_slices / people |> Float.floor |> round
      remainder = rem(total_slices, slices_per_person)
      {slices_per_person, remainder}
    end
  end
end
