defmodule SayingHelloTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest SayingHello

  test "says hello world" do
    say_hello = fn ->
      SayingHello.CLI.main(nil)
    end
    assert capture_io(say_hello) == "Hello world\n"
  end
end
