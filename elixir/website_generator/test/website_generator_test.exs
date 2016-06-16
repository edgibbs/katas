defmodule WebsiteGeneratorTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WebsiteGenerator

  test "templates a website" do
    website_generator = fn -> WebsiteGenerator.CLI.main(nil) end
    assert capture_io([input: "awesomeco\nMax Power\ny\ny"], website_generator) ==
    "Site name: Author: Do you want a folder for Javascript? Do you want a folder for CSS? "
  end
end
