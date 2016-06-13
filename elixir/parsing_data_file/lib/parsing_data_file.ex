defmodule ParsingDataFile do
  defmodule CLI do
    def main(_args) do
      contents = File.read!("employees.csv")
      IO.puts("Last     First     Salary\n ------------------------")
      lines = String.split(contents, "\n")
      Enum.map(lines, fn(line) ->
        employee = String.split(line, ",")
        IO.puts "#{Enum.at(employee, 0)} #{Enum.at(employee, 1)} #{Enum.at(employee, 2)}\n"
      end)
    end
  end
end
