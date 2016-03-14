defmodule MadLib do
  defmodule CLI do
    def main(_args) do
      answers = %{}
      |> Map.put_new(:noun, get_answer("Enter a noun"))
      |> Map.put_new(:verb, get_answer("Enter a verb"))
      |> Map.put_new(:adjective, get_answer("Enter an adjective"))
      |> Map.put_new(:adverb, get_answer("Enter an adverb"))
      IO.puts make_mad_lib(answers)
    end

    def make_mad_lib(answers) do
      """
      Do you #{answers.verb} your #{answers.adjective} #{answers.noun} #{answers.adverb}?
      That's hilarious!
      """
    end

    defp get_answer(prompt) do
      IO.gets(prompt <> ": ") |> String.strip
    end
  end
end
