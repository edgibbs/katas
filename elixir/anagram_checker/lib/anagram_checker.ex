defmodule AnagramChecker do
  defmodule CLI do
    def main(_args) do
      IO.puts("Enter two strings and I'll tell you if they're anagrams: ")
      first_word = IO.gets("Enter the first string: ") |> String.strip
      second_word = IO.gets("Enter the second string: ") |> String.strip
      if is_anagram(first_word, second_word) do
        IO.puts "\"#{first_word}\" and \"#{second_word}\" are anagrams."
      else
        IO.puts "\"#{first_word}\" and \"#{second_word}\" are not anagrams."
      end
    end

    defp is_anagram(first_word, second_word) do
      if normalize(first_word) == normalize(second_word) do
        true
      else
        false
      end
    end

    defp normalize(word) do
      word
      |> String.to_char_list
      |> Enum.sort
    end
  end
end
