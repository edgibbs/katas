defmodule GuessNumbers do
  defmodule CLI do
    def main(args) do
      not_random_number =
      case args do
        [] -> nil
        _ -> Enum.fetch(args, 0) |> elem(1)
      end
      play_game(not_random_number)
    end

    defp play_game(not_random_number) do
      IO.puts "Let's play Guess the Number."
      {difficulty_level, _} = IO.gets("Pick a difficulty level (1, 2, or 3): ") |> String.strip |> Integer.parse
      secret_number = pick_random_number(difficulty_level, not_random_number)
      first_guess = IO.gets("I have my number. What's your guess? ") |> String.strip |> Integer.parse
      check_guess(first_guess, secret_number, 0, not_random_number)
    end

    defp check_guess(guess, secret_number, guesses, not_random_number) do
      guesses = guesses + 1
      cond do
        guess == :error ->
          new_guess = IO.gets("Guess again: ") |> String.strip |> Integer.parse
          check_guess(new_guess, secret_number, guesses, not_random_number)
        entered_guess(guess) == secret_number ->
          IO.puts "You got it in #{guesses} guesses!"
          play_again = IO.gets("Play again? ") |> String.strip
          if play_again == "y" do
            if not_random_number do
              play_game(not_random_number) # for testing
            else
              play_game(nil)
            end
          else
            IO.puts("All done.")
            if not_random_number do
              # for testing
            else
              System.halt(0)
            end
          end
        entered_guess(guess) > secret_number ->
          new_guess = IO.gets("Too high. Guess again: ") |> String.strip |> Integer.parse
          check_guess(new_guess, secret_number, guesses, not_random_number)
        entered_guess(guess) < secret_number ->
          new_guess = IO.gets("Too low. Guess again: ") |> String.strip |> Integer.parse
          check_guess(new_guess, secret_number, guesses, not_random_number)
      end
    end

    defp pick_random_number(difficulty_level, not_random_number) do
      if not_random_number do
        not_random_number
      else
        :random.uniform(difficulty_level * 10)
      end
    end

    defp entered_guess(guess) do
      elem(guess, 0)
    end
  end
end
