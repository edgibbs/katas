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
      is_clicking = IO.gets("Does the car make a clicking noise? ") |> String.strip |> String.downcase
      if is_clicking == "y" do
        IO.puts("Replace the battery.")
      else
        fail_to_start
      end
    end

    defp fail_to_start do
      is_not_starting = IO.gets("Does the car crank up but fail to start? ") |> String.strip |> String.downcase
      if is_not_starting == "y" do
        IO.puts("Check spark plug connections.")
      else
        engine_start_then_die
      end
    end

    defp engine_start_then_die do
      is_starting_then_die = IO.gets("Does the engine start and then die? ") |> String.strip |> String.downcase
      if is_starting_then_die == "y" do
        fuel_injection
      else
        IO.puts("Get it in for service.")
      end
    end

    defp fuel_injection do
      has_fuel_injection = IO.gets("Does your car have fuel injection? ") |> String.strip |> String.downcase
      if has_fuel_injection == "y" do
        IO.puts("Get it in for service.")
      else
        IO.puts("Check to ensure the choke is opening and closing.")
      end
    end
  end
end
