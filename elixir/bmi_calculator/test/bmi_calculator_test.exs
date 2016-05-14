defmodule BmiCalculatorTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest BmiCalculator

  defmodule FakeSystem do
    def halt(0) do
      {1000, nil }
    end
  end

  defp bmi_calculator do
    fn -> BmiCalculator.CLI.main(FakeSystem) end
  end

  test "when underweight" do
    assert capture_io([input: "110\n72"], bmi_calculator) ==
    """
    Your weight in pounds: Your height in inches: Your BMI is 14.9.
    You are underweight. You should see your doctor.
    """
  end

  test "when overweight" do
    assert capture_io([input: "300\n72"], bmi_calculator) ==
    """
    Your weight in pounds: Your height in inches: Your BMI is 40.7.
    You are overweight. You should see your doctor.
    """
  end

  test "when ideal weight range" do
    assert capture_io([input: "195\n76"], bmi_calculator) ==
    """
    Your weight in pounds: Your height in inches: Your BMI is 23.7.
    You are within the ideal weight range.
    """
  end

  @tag :pending
  test "use non-numeric data" do
    assert capture_io([input: "pounds"], bmi_calculator) == "Your weight in pounds: Numbers stupid"
  end
end
