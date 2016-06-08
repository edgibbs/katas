defmodule SortingRecordsTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest SortingRecords

  test "shows employees by last name" do
    sorting_records = fn -> SortingRecords.CLI.main(nil) end
    assert capture_io([input: ""], sorting_records) ==
    """
    Name                 | Position             | Separation Date
    -------------------------------------------------------------
    Jacquelyn Jackson    | DBA                  |             
    Jake Jacobson        | Programmer           |             
    John Johnson         | Manager              | 2016-12-31  
    Michaela Michaelson  | District Manager     | 2015-12-19  
    Sally Weber          | Web Developer        | 2015-12-18  
    Tou Xiong            | Software Engineer    | 2016-10-05  
    """
  end
end
