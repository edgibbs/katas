defmodule ValidatingInputs do
  defmodule CLI do
    def main(_args) do
      first_name = IO.gets("Enter the first name: ") |> String.strip
      last_name = IO.gets("Enter the last name: ") |> String.strip
      zip = IO.gets("Enter the ZIP code: ") |> String.strip
      id = IO.gets("Enter an employee ID: ") |> String.strip
      errors = validate_input(first_name, last_name, zip, id)
      if Enum.count(errors) > 0 do
        Enum.map(errors, fn(error) -> IO.puts error end)
      end
    end

    defp validate_input(first_name, last_name, zip, id) do
      errors = {}
      unless has_value(first_name) do
        errors = Tuple.append(errors, "The first name must be filled in.")
      end
      unless has_value(last_name) do
        errors = Tuple.append(errors, "The last name must be filled in.")
      end
      if too_short(first_name) do
        errors = Tuple.append(errors, "\"#{first_name}\" is not a valid first name. It is too short.")
      end
      if too_short(last_name) do
        errors = Tuple.append(errors, "\"#{last_name}\" is not a valid last name. It is too short.")
      end
      if not_numeric(zip) do
        errors = Tuple.append(errors, "The ZIP code must be numeric.")
      end
      unless valid_employee_id(id) do
        errors = Tuple.append(errors, "#{id} is not a valid ID.")
      end
      if Enum.empty?(Tuple.to_list(errors)) do
        errors = Tuple.append(errors, "There were no errors found.")
      end
      Tuple.to_list(errors)
    end

    defp has_value(name) do
      String.length(name) > 0
    end

    defp too_short(name) do
      String.length(name) == 1
    end

    defp not_numeric(zip) do
      if Integer.parse(zip) == :error do
        true
      end
    end

    defp valid_employee_id(id) do
      Regex.match?(~r/^[a-zA-Z]{2}-\d\d\d\d$/, id)
    end
  end
end
