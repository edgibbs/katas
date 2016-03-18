defmodule RetirementCalculator do
  defmodule CLI do

    def main(_args) do
      current_age = IO.gets("What is your current age? ") |> String.strip |> String.to_integer
      retirement_age = IO.gets("What age would you like to retire? ") |> String.strip |> String.to_integer
      IO.puts retirement_statement(current_age, retirement_age)
    end

    def retirement_statement(current_age, retirement_age) do
      {{current_year, _, _}, {_,_,_}} = :calendar.now_to_local_time(:erlang.timestamp)
      """
      You have #{retirement_age - current_age} years left until retirement.
      It's #{current_year}, so you can retire in #{current_year + 40}.
      """
    end
  end
end
