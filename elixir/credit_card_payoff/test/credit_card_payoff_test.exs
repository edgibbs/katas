defmodule CreditCardPayoffTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest CreditCardPayoff

  defp credit_card_payoff  do
    fn -> CreditCardPayoff.CLI.main(nil) end
  end

  test "the truth" do
    assert capture_io([input: "5000\n12\n100"], credit_card_payoff) ==
    """
    What is your balance? What is the APR on the card (as a percent)? What is the monthly payment you can make? It will take you 70 months to pay off this card.
    """
  end
end
