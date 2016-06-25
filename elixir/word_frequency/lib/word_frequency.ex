defmodule WordFrequency do
  defmodule CLI do
    def main(_args) do
      File.read!("words.txt")
      |> String.strip
      |> String.split(" ")
      |> Enum.sort
      |> Enum.chunk_by(&(&1))
      |> Enum.sort(&(Enum.count(&1) > Enum.count(&2)))
      |> Enum.each(fn(word_list) -> print_line(word_list) end)
    end

    defp print_line(word_list) do
      IO.puts "#{List.first(word_list)}: #{print_asterisks(Enum.count(word_list), "") }"
    end

    defp print_asterisks(0, asterisk_line) do
      asterisk_line
    end

    defp print_asterisks(number, asterisk_line) do
      print_asterisks(number - 1, asterisk_line <> "*")
    end
  end
end
