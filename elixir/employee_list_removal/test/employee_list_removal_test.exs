defmodule EmployeeListRemovalTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest EmployeeListRemoval

  test "can remove 1 employee" do
    employee_list_removal = fn -> EmployeeListRemoval.CLI.main(nil) end
    assert capture_io([input: "Chris Jones"], employee_list_removal) ==
    """
    There are 5 employees:
    John Smith
    Jackie Johnson
    Chris Jones
    Amanda Cullen
    Jeremy Goodwin
    Enter an employee name to remove: There are 4 employees:
    John Smith
    Jackie Johnson
    Amanda Cullen
    Jeremy Goodwin
    """
  end
end
