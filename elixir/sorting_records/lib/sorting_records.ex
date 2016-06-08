defmodule SortingRecords do
  defmodule CLI do
    def main(_args) do
      employees = [
        %{first_name: "John", last_name: "Johnson", position: "Manager", separation_date: "2016-12-31"},
        %{first_name: "Tou", last_name: "Xiong", position: "Software Engineer", separation_date: "2016-10-05"},
        %{first_name: "Michaela", last_name: "Michaelson", position: "District Manager", separation_date: "2015-12-19"},
        %{first_name: "Jake", last_name: "Jacobson", position: "Programmer", separation_date: ""},
        %{first_name: "Jacquelyn", last_name: "Jackson", position: "DBA", separation_date: ""},
        %{first_name: "Sally", last_name: "Weber", position: "Web Developer", separation_date: "2015-12-18"}
        ]
        sorted_employees = Enum.sort(employees, &(&2.last_name > &1.last_name))
        print_header
        print_employees(sorted_employees)
    end

    defp print_header do
      IO.puts "Name                 | Position             | Separation Date\n-------------------------------------------------------------"
    end

    defp print_employees(employees) do
      Enum.map(employees, fn(employee) -> IO.puts "#{String.ljust(employee.first_name <> " " <> employee.last_name, 20)} | #{String.ljust(employee.position, 20)} | #{String.ljust(employee.separation_date, 12)}" end)
    end
  end
end
