defmodule ComputingStatisticsTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ComputingStatistics

  test "computes a bunch of stats for a series of numbers" do
    computing_statistics = fn -> ComputingStatistics.CLI.main(nil) end
    assert capture_io([input: "100\n200\n1000\n300\ndone\n"], computing_statistics)==
    """
    Enter a number: Enter a number: Enter a number: Enter a number: Enter a number: Numbers: 100, 200, 1000, 300
    The average is 400.
    The minimum is 100.
    The maximum is 1000.
    The standard deviation is 408.25.
    """
  end
end
