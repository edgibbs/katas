defmodule MadLibTest do
  use ExUnit.Case
  doctest MadLib

  test "makes a hilarious mad lib" do
    inputs = %{noun: "dog", verb: "walk", adjective: "blue", adverb: "quickly"}
    expected_output = """
    Do you walk your blue dog quickly?
    That's hilarious!
    """
    assert MadLib.CLI.make_mad_lib(inputs) == expected_output
  end
end
