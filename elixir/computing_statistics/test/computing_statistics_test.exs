defmodule ComputingStatisticsTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ComputingStatistics

  test "" do
    computing_statistics = fn -> ComputingStatistics.CLI.main(nil) end
    assert capture_io([input: "100\n200\n1000\n300\ndone\n"], computing_statistics)==
    """
    Enter a number: Enter a number: Enter a number: Enter a number: Enter a number: Numbers: 
    """
  end
end
