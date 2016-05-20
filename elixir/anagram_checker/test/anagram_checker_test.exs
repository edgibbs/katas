defmodule AnagramCheckerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest AnagramChecker

  defp anagram_checker do
    fn -> AnagramChecker.CLI.main(nil) end
  end

  test "valid anagram" do
    assert capture_io([input: "note\ntone"], anagram_checker) ==
    """
    Enter two strings and I'll tell you if they're anagrams: 
    Enter the first string: Enter the second string: "note" and "tone" are anagrams.
    """
  end
end
