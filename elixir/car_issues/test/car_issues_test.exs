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

  test "when the terminals are good" do
    assert capture_io([input: "y\nn"], car_issues) ==
    """
    Is the car silent when you turn the key? Are the battery terminals corroded? Replace cables and try again.
    """
  end

  test "when the battery is dead" do
    assert capture_io([input: "n\ny"], car_issues) ==
    """
    Is the car silent when you turn the key? Does the car make a clicking noise? Replace the battery.
    """
  end

  test "when crank but fails to start" do
    assert capture_io([input: "n\nn\ny"], car_issues) ==
    """
    Is the car silent when you turn the key? Does the car make a clicking noise? Does the car crank up but fail to start? Check spark plug connections.
    """
  end

  test "when the engine starts and then dies" do
    assert capture_io([input: "n\nn\nn\nn"], car_issues) ==
    """
    Is the car silent when you turn the key? Does the car make a clicking noise? Does the car crank up but fail to start? Does the engine start and then die? Get it in for service.
    """
  end

  test "when the engine starts and then dies with fuel injection" do
    assert capture_io([input: "n\nn\nn\ny\ny"], car_issues) ==
    """
    Is the car silent when you turn the key? Does the car make a clicking noise? Does the car crank up but fail to start? Does the engine start and then die? Does your car have fuel injection? Get it in for service.
    """
  end

  test "when the engine starts and then dies without fuel injection" do
    assert capture_io([input: "n\nn\nn\ny\nn"], car_issues) ==
    """
    Is the car silent when you turn the key? Does the car make a clicking noise? Does the car crank up but fail to start? Does the engine start and then die? Does your car have fuel injection? Check to ensure the choke is opening and closing.
    """
  end
end
