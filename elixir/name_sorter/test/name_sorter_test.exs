defmodule NameSorterTest do
  use ExUnit.Case
  doctest NameSorter

  test "writes a sorted email file" do
    NameSorter.CLI.main(nil)
    output = File.read!("names.txt")
    assert output ==
    """
    Total of 7 names
    ----------------
    Johnson, Jim
    Jones, Aaron
    Jones, Chris
    Ling, Mai
    Swift, Geoffrey
    Xiong, Fong
    Zarnecki, Sabrina
    """
  end
end
