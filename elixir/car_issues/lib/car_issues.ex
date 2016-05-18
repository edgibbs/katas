defmodule CarIssues do
  defmodule CLI do
    def main(_args) do
      is_silent = IO.gets("Is the car silent when you turn the key? ") |> String.strip |> String.downcase
      if is_silent == "y", do: battery_corroded, else: clicking_noise
    end

    defp battery_corroded do
      is_corroded = IO.gets("Are the battery terminals corroded? ") |> String.strip |> String.downcase
      if is_corroded == "y" do
        IO.puts("Clean terminals and try starting again.")
      else
        IO.puts("Replace cables and try again.")
      end
    end

    defp clicking_noise do
    end
  end
end
