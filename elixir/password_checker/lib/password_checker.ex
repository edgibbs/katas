defmodule PasswordChecker do
  defmodule CLI do
    def main(password) do
      character_count = String.length(password)
      has_number = Regex.match?(~r/\d+/, password)
      has_letters = Regex.match?(~r/\w+/, password)
      has_special_characters = Regex.match?(~r/[^\w\*]+/, password)
      strength = password_validator(character_count, has_number, has_letters, has_special_characters)
      case strength do
        :very_weak -> IO.puts "The password '#{password}' is a very weak password."
      end
    end

    defp password_validator(character_count, has_number, has_letters, has_special_characters) do
      cond do
        character_count > 7 && has_number && has_letters && has_special_characters -> :very_strong
        character_count > 7 && has_number && has_letters -> :strong
        character_count < 8 && !has_number && has_letters -> :weak
        character_count < 8 && has_number && !has_letters -> :very_weak
        true -> :very_weak
      end
    end
  end
end
