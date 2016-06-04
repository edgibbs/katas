defmodule PasswordGenerator do
  defmodule CLI do
    def main(_args) do
      {minimum, _} = IO.gets("What's the minimum length: ") |> String.strip |> Integer.parse
      {number_of_special_characters, _} = IO.gets("How many special characters? ") |> String.strip |> Integer.parse
      {numbers, _} = IO.gets("How many numbers? ") |> String.strip |> Integer.parse
    end

    defp available_characters do
      ?a..?z |> Enum.map(&List.to_string([&1]))
    end
  end
end
