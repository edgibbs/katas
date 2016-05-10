defmodule DrivingAgeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest DrivingAge

  test "age 16" do
    driving_age = fn ->
      DrivingAge.CLI.main(nil)
    end
    assert capture_io([input: "16"], driving_age) == "What is your age? You are old enough to legally drive.\n"
  end

  test "under 16" do
    driving_age = fn ->
      DrivingAge.CLI.main(nil)
    end
    assert capture_io([input: "15"], driving_age) == "What is your age? You are not old enough to legally drive.\n"
  end
end
