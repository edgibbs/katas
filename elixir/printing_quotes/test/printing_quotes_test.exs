defmodule PrintingQuotesTest do
  use ExUnit.Case
  doctest PrintingQuotes

  test "algorithim returns star wars quote after prompting" do
    assert PrintingQuotes.CLI.quoted_response("These aren't the droids you're looking for.", "Obi-Wan Kenobi") == "Obi-Wan Kenobi says, \"These aren't the droids you're looking for.\""
  end
end
