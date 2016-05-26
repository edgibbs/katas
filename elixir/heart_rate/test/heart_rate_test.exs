defmodule HeartRateTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest HeartRate

  test "the truth" do
    heart_rate = fn -> HeartRate.CLI.main(nil) end
    assert capture_io([input: "10\n80"], heart_rate) ==
    """
    What is your age? What is your resting heart rate? 
    Intensity    | Rate
    -------------|-----

    """
  end
end
