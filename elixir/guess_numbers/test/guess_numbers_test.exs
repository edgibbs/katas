defmodule GuessNumbersTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest GuessNumbers

  test "can play a simple guessing game" do
    guess_numbers = fn -> GuessNumbers.CLI.main([2]) end
    assert capture_io([input: "1\n1\n5\n2\nn"], guess_numbers) ==
      """
      Let's play Guess the Number.
      Pick a difficulty level (1, 2, or 3): I have my number. What's your guess? Too low. Guess again: Too high. Guess again: You got it in 3 guesses!
      Play again? All done.
      """
  end

  test "can play multiple games" do
    guess_numbers = fn -> GuessNumbers.CLI.main([2]) end
    assert capture_io([input: "1\n2\ny\n1\n2\nn"], guess_numbers) ==
      """
      Let's play Guess the Number.
      Pick a difficulty level (1, 2, or 3): I have my number. What's your guess? You got it in 1 guesses!
      Play again? Let's play Guess the Number.
      Pick a difficulty level (1, 2, or 3): I have my number. What's your guess? You got it in 1 guesses!
      Play again? All done.
      """
  end
end
