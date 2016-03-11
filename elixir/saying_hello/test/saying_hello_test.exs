defmodule SayingHelloTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest SayingHello

  test "prompts for name and delivers greeting" do
    say_hello = fn ->
      SayingHello.CLI.main(nil)
    end
    assert capture_io([input: "Ed"], say_hello) == "What is your name?Hello, Ed, nice to meet you!\n"
  end
end
