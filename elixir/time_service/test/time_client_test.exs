defmodule TimeClientTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "gets the time" do
    time_client = fn -> TimeClient.main(nil) end
    assert capture_io([input: ""], time_client) == "Some time"
  end
end
