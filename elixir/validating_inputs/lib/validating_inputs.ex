defmodule ValidatingInputs do
  defmodule CLI do
    def main(_args) do
      first_name = IO.gets("Enter the first name: ") |> String.strip
      last_name = IO.gets("Enter the last name: ") |> String.strip
      zip = IO.gets("Enter the ZIP code: ") |> String.strip
      id = IO.gets("Enter an employee ID: ") |> String.strip
      errors = validate_input(first_name, last_name, zip, id)
      if Enum.count(errors) > 0 do
        IO.puts List.first(errors)
      end
    end

    defp validate_input(first_name, last_name, zip, id) do
      errors = {}
      unless has_value(first_name) do
        errors = Tuple.append(errors, "The first name must be filled in.")
      end
      Tuple.to_list(errors)
    end

    defp has_value(name) do
      String.length(name) > 0
    end
  end
end
