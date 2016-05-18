defmodule CarIssuesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest CarIssues

  defp car_issues do
    fn -> CarIssues.CLI.main(nil) end
  end

  test "when the terminals are bad" do
    assert capture_io([input: "y\ny"], car_issues) ==
    """
    Is the car silent when you turn the key? Are the battery terminals corroded? Clean terminals and try starting again.
    """
  end
end
