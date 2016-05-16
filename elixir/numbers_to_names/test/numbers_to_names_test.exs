defmodule NumbersToNamesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest NumbersToNames

  defp numbers_to_names do
    fn -> NumbersToNames.CLI.main(nil) end
  end

  test "converts numbers to names of months" do
    assert capture_io([input: "1"], numbers_to_names) == "Please enter the number of the month: The name of the month is January.\n"
    assert capture_io([input: "2"], numbers_to_names) == "Please enter the number of the month: The name of the month is February.\n"
    assert capture_io([input: "3"], numbers_to_names) == "Please enter the number of the month: The name of the month is March.\n"
    assert capture_io([input: "4"], numbers_to_names) == "Please enter the number of the month: The name of the month is April.\n"
    assert capture_io([input: "5"], numbers_to_names) == "Please enter the number of the month: The name of the month is May.\n"
    assert capture_io([input: "6"], numbers_to_names) == "Please enter the number of the month: The name of the month is June.\n"
    assert capture_io([input: "7"], numbers_to_names) == "Please enter the number of the month: The name of the month is July.\n"
    assert capture_io([input: "8"], numbers_to_names) == "Please enter the number of the month: The name of the month is August.\n"
    assert capture_io([input: "9"], numbers_to_names) == "Please enter the number of the month: The name of the month is September.\n"
    assert capture_io([input: "10"], numbers_to_names) == "Please enter the number of the month: The name of the month is October.\n"
    assert capture_io([input: "11"], numbers_to_names) == "Please enter the number of the month: The name of the month is November.\n"
    assert capture_io([input: "12"], numbers_to_names) == "Please enter the number of the month: The name of the month is December.\n"
  end

  test "non month returns error message" do
    assert capture_io([input: "13"], numbers_to_names) == "Please enter the number of the month: There is no such month.\n"
  end
end
