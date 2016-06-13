defmodule ParsingDataFileTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ParsingDataFile

  test "prints out a nice table of employees" do
    parsing_data_file = fn -> ParsingDataFile.CLI.main(nil) end
    assert capture_io([input: ""], parsing_data_file) ==
    """
    Last     First     Salary
    -------------------------
    Ling     Mai       55900
    Johnson  Jim       56500
    Jones    Aaron     46000
    Jones    Chris     34500
    Swift    Geoffrey  14200
    Xiong    Fong      65000
    Zarnecki Sabrina   51500
    """
  end
end
