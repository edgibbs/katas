defmodule ParsingDataFile do
  defmodule CLI do
    def main(_args) do
      contents = File.read!("employees.csv") |> String.strip
      IO.puts("Last     First    Salary\n------------------------")
      lines = String.split(contents, "\n")
      employees = Enum.map(lines, fn(line) ->
        employee = String.split(line, ",")
        %{first_name: Enum.at(employee, 1), last_name: Enum.at(employee, 0), salary: Enum.at(employee, 2)}
      end)
      longest_last_name = Enum.map(employees, fn(employee) -> String.length(employee.last_name) end) |> Enum.max
      longest_first_name = Enum.map(employees, fn(employee) -> String.length(employee.first_name) end) |> Enum.max
      Enum.map(employees, fn(employee) ->
        IO.puts "#{String.ljust(employee.last_name, longest_last_name)} #{String.ljust(employee.first_name, longest_first_name)} #{employee.salary}"
      end)
    end
  end
end
