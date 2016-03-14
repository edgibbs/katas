defmodule PrintingQuotes do
  defmodule CLI do
    def main(_args) do
      the_quote = IO.gets("What is the quote? ") |> String.strip
      author = IO.gets("Who said it? ") |> String.strip
      IO.puts quoted_response(the_quote, author)
    end

    def quoted_response(the_quote, author) do
      author <> ~s( says, ") <> the_quote <> ~s(")
    end
  end
end
