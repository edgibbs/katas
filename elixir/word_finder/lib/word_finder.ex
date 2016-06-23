defmodule WordFinder do
  defmodule CLI do
    def main(_args) do
      file_name = IO.gets("What do you want the file name to be? ") |> String.strip
      contents = File.read!("sample.txt") #|> String.strip
      replaced_contents = String.replace(contents, "utilize", "use")
      {:ok, file} = File.open(file_name, [:write])
      IO.binwrite(file, replaced_contents)
    end
  end
end
