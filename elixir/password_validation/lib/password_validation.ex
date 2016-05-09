defmodule PasswordValidation do
  defmodule CLI do
    def main(_args) do
      if IO.gets("What is the password? ") |> String.strip |> validate do
        IO.puts("Welcome!")
      else
        IO.puts("I don't know you.")
      end
    end

    defp validate(password) do
      password == "abc$123"
    end
  end
end
