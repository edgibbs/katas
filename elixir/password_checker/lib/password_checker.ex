defmodule PasswordChecker do
  defmodule CLI do
    def main(args) do
      {:ok, password} = Enum.fetch(args, 0)
      password = password |> String.strip
      case password_validator(password) do
        :very_weak -> IO.puts "The password '#{password}' is a very weak password."
        :weak -> IO.puts "The password '#{password}' is a weak password."
        :strong -> IO.puts "The password '#{password}' is a strong password."
        :very_strong -> IO.puts "The password '#{password}' is a very strong password."
      end
    end

    defp password_validator(password) do
      {character_count, has_number, has_letters, has_special_characters} = password_checks(password)
      cond do
        character_count > 7 && has_number && has_letters && has_special_characters -> :very_strong
        character_count > 7 && has_number && has_letters -> :strong
        character_count < 8 && !has_number && has_letters -> :weak
        true -> :very_weak
      end
    end

    defp password_checks(password) do
      character_count = String.length(password)
      has_number = Regex.match?(~r/\d+/, password)
      has_letters = Regex.match?(~r/\w+/, password)
      has_special_characters = Regex.match?(~r/[^\w\*]+/, password)
      {character_count, has_number, has_letters, has_special_characters}
    end
  end
end
