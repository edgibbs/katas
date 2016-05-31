defmodule EmployeeListRemoval do
  defmodule CLI do
    @employees ["John Smith", "Jackie Johnson", "Chris Jones", "Amanda Cullen", "Jeremy Goodwin"]

    def main(_args) do
      print_employees(@employees)
      employee_to_remove = IO.gets("Enter an employee name to remove: ") |> String.rstrip
      print_employees(Enum.reject(@employees, fn(employee) -> employee == employee_to_remove end))
    end

    defp print_employees(employees) do
      IO.puts "There are #{Enum.count(employees)} employees:"
      Enum.map(employees, fn(employee) -> IO.puts(employee) end)
    end
  end
end
