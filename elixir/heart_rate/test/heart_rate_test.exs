defmodule HeartRateTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest HeartRate

  test "prints heart rate table" do
    heart_rate = fn -> HeartRate.CLI.main(nil) end
    assert capture_io([input: "22\n65\n"], heart_rate) ==
    """
    What is your age? What is your resting heart rate? 
    Intensity    | Rate
    -------------|--------
    55%          | 138 bpm
    60%          | 145 bpm
    65%          | 151 bpm
    70%          | 158 bpm
    75%          | 165 bpm
    80%          | 171 bpm
    85%          | 178 bpm
    90%          | 185 bpm
    95%          | 191 bpm

    """
  end

  test "handles invalid input for age and heart rate" do
    heart_rate = fn -> HeartRate.CLI.main(nil) end
    assert capture_io([input: "xxx\n22\nyyy\n65"], heart_rate) ==
    """
    What is your age? What is your age? What is your resting heart rate? What is your resting heart rate? 
    Intensity    | Rate
    -------------|--------
    55%          | 138 bpm
    60%          | 145 bpm
    65%          | 151 bpm
    70%          | 158 bpm
    75%          | 165 bpm
    80%          | 171 bpm
    85%          | 178 bpm
    90%          | 185 bpm
    95%          | 191 bpm

    """
  end
end
