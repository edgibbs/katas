defmodule ValidatingInputsTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ValidatingInputs

  defp validating_inputs do
    fn -> ValidatingInputs.CLI.main(nil) end
  end

  test "must have a first name" do
    assert capture_io([input: "\nSmith\n55555\nAA-1234"], validating_inputs) ==
    """
    Enter the first name: Enter the last name: Enter the ZIP code: Enter an employee ID: The first name must be filled in.
    """
  end

  test "must have a last name" do
    assert capture_io([input: "Alyse\n\n55555\nAA-1234"], validating_inputs) ==
    """
    Enter the first name: Enter the last name: Enter the ZIP code: Enter an employee ID: The last name must be filled in.
    """
  end

  test "Names must be at least 2 characters" do
    assert capture_io([input: "H\nA\n55555\nAA-1234"], validating_inputs) ==
    """
    Enter the first name: Enter the last name: Enter the ZIP code: Enter an employee ID: "H" is not a valid first name. It is too short.
    "A" is not a valid last name. It is too short.
    """
  end

  test "zip code must be a number" do
    assert capture_io([input: "Alyse\nBedilia\nABCDE\nAA-1234"], validating_inputs) ==
    """
    Enter the first name: Enter the last name: Enter the ZIP code: Enter an employee ID: The ZIP code must be numeric.
    """
  end

  test "employee id must follow format" do
    assert capture_io([input: "Alyse\nBedilia\n55555\nA12-1234"], validating_inputs) ==
    """
    Enter the first name: Enter the last name: Enter the ZIP code: Enter an employee ID: A12-1234 is not a valid ID.
    """
  end

  test "with no errors" do
    assert capture_io([input: "Alyse\nBedilia\n55555\nAA-1234"], validating_inputs) ==
    """
    Enter the first name: Enter the last name: Enter the ZIP code: Enter an employee ID: There were no errors found.
    """
  end
end
