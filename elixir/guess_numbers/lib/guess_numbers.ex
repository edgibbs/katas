defmodule GuessNumbers do
  defmodule CLI do
    def main(args \\ [nil]) do
      {:ok, not_random_number} = Enum.fetch(args, 0)
      IO.puts "Let's play Guess the Number."
      {difficulty_level, _} = IO.gets("Pick a difficulty level (1, 2, or 3): ") |> String.strip |> Integer.parse
      secret_number = pick_random_number(difficulty_level, not_random_number)
      {first_guess, _} = IO.gets("I have my number. What's your guess? ") |> String.strip |> Integer.parse
      check_guess(first_guess, secret_number, 0)
    end

    defp check_guess(guess, secret_number, guesses) do
      guesses = guesses + 1
      cond do
        guess == secret_number ->
          IO.puts "You got it in #{guesses} guesses!"
        guess > secret_number ->
          {new_guess, _} = IO.gets("Too high. Guess again: ") |> String.strip |> Integer.parse
          check_guess(new_guess, secret_number, guesses)
        guess < secret_number ->
          {new_guess, _} = IO.gets("Too low. Guess again: ") |> String.strip |> Integer.parse
          check_guess(new_guess, secret_number, guesses)
      end
    end

    defp pick_random_number(difficulty_level, not_random_number) do
      if not_random_number do
        not_random_number
      else
        :random.uniform(difficulty_level * 10)
      end
    end
  end
end
