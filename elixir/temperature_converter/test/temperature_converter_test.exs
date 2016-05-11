defmodule TemperatureConverterTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest TemperatureConverter

  test "converts fahrenheit to celcius" do
    temperature_converter = fn ->
      TemperatureConverter.CLI.main(nil)
    end
    assert capture_io([input: "C\n32"], temperature_converter) ==
    """
    Press C to convert from Fahrenheit to Celcius.
    Press F to covert from Celsius to Fahrenheit.

    Your choice: Please enter the temperature in Fahrenheit: The temperature in Celcius is 0
    """
  end

  test "converts celcius to fahrenheit" do
    temperature_converter = fn ->
      TemperatureConverter.CLI.main(nil)
    end
    assert capture_io([input: "F\n0"], temperature_converter) ==
    """
    Press C to convert from Fahrenheit to Celcius.
    Press F to covert from Celsius to Fahrenheit.

    Your choice: Please enter the temperature in Celcius: The temperature in Fahrenheit is 32
    """
  end
end
