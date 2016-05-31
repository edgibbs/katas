defmodule MagicEightBall do
  defmodule CLI do
    def main(args) do
      IO.gets "What's your question? "
      IO.puts answer
    end

    def answer do
      Enum.random ["Yes.", "No.", "Maybe.", "Ask again later."]
    end
  end
end
