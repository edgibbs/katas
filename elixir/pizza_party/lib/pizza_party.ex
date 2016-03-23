defmodule PizzaParty do
  defmodule CLI do
    def main(_args) do
      people = IO.gets("How many people? ") |> String.strip |> String.to_integer
      number_of_pizzas = IO.gets("How many pizzas do you have? ") |> String.strip |> String.to_integer
      slices_per_pizza = IO.gets("How many slices per pizza? ") |> String.strip |> String.to_integer
      {slices_per_person, remainder} = slices_per_and_remainder(people, slices_per_pizza, number_of_pizzas)
      IO.puts response(slices_per_person, remainder)
    end

    def slices_per_and_remainder(people, slices_per_pizza, number_of_pizzas) do
      total_slices = slices_per_pizza * number_of_pizzas
      slices_per_person = total_slices / people |> Float.floor |> round
      remainder = total_slices - (people * slices_per_person)
      {slices_per_person, remainder}
    end

    defp response(slices_per_person, remainder) do
      """
      Each person gets #{slices_per_person} pieces of pizza.
      There are #{remainder} leftover pieces.
      """
    end
  end
end
