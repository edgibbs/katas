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
end
