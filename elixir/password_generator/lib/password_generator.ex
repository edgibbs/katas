defmodule PasswordGenerator do
  defmodule CLI do
    def main(_args) do
      {minimum, _} = IO.gets("What's the minimum length: ") |> String.strip |> Integer.parse
      {number_of_special_characters, _} = IO.gets("How many special characters? ") |> String.strip |> Integer.parse
      {numbers, _} = IO.gets("How many numbers? ") |> String.strip |> Integer.parse
      IO.puts "Your password is #{random_password(minimum, number_of_special_characters, numbers)}"
    end

    def random_password(minimum, number_of_special_characters, numbers) do
      random_numbers = Enum.take_random(available_numbers, numbers)
      random_special_characters = Enum.take_random(available_special_characters, number_of_special_characters)
      random_characters = Enum.take_random(available_characters, (minimum - (number_of_special_characters + numbers)))
      initial_password = random_numbers ++ random_special_characters ++ random_characters
      Enum.shuffle(initial_password) |> Enum.join
    end

    defp available_characters do
      ?a..?z |> Enum.map(&List.to_string([&1]))
    end

    defp available_special_characters do
      ~w[! @ # $ % ^ & * ( ) - _ + =]
    end

    defp available_numbers do
      0..9
    end
  end
end
