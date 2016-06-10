defmodule FilteringRecordsTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest FilteringRecords

  test "shows employees by last name" do
    filtering_records = fn -> FilteringRecords.CLI.main(nil) end
    assert capture_io([input: "Jac\n"], filtering_records) ==
    """
    Enter a search string: Name                 | Position             | Separation Date
    -------------------------------------------------------------
    Jacquelyn Jackson    | DBA                  |             
    Jake Jacobson        | Programmer           |             
    """
  end
end
