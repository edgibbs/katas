defmodule CountCharacters do
  defmodule CLI do
    def main(_args) do
      input_string = IO.gets("What is the input string?") |> String.strip
      IO.puts "#{input_string} has #{input_string |> String.length} characters."
    end
  end
end
