defmodule WebsiteGeneratorTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WebsiteGenerator

  def website_generator do
    fn -> WebsiteGenerator.CLI.main(nil) end
  end

  setup do
    on_exit fn ->
      File.rm_rf("awesomeco")
    end
  end

  test "templates a website" do
    assert capture_io([input: "awesomeco\nMax Power\ny\ny"], website_generator) ==
    "Site name: Author: Do you want a folder for Javascript? Do you want a folder for CSS? Created ./awesomeco\nCreated ./awesomeco/index.html\nCreated ./awesomeco/js\nCreated ./awesomeco/css\n"
  end

  test "creates a directory" do
    capture_io([input: "awesomeco\nMax Power\ny\ny"], website_generator)
    assert File.exists?("awesomeco")
  end

  test "creates a file with the authors name" do
    capture_io([input: "awesomeco\nMax Power\ny\ny"], website_generator)
    assert File.read!("awesomeco/index.html") ==
    """
    <html>
    <head>
    <title>awesomeco</title>
    <meta name="Author" content="Max Power">
    </head>
    <body>
    </body>
    </html>
    """
  end

  test "creates a javascript folder" do
    capture_io([input: "awesomeco\nMax Power\ny\ny"], website_generator)
    assert File.exists?("awesomeco/js")
  end

  test "doesn't create a javascript folder if not asked for" do
    capture_io([input: "awesomeco\nMax Power\nn\ny"], website_generator)
    refute File.exists?("awesomeco/js")
  end

  test "creates a css folder" do
    capture_io([input: "awesomeco\nMax Power\ny\ny"], website_generator)
    assert File.exists?("awesomeco/css")
  end

  test "doesn't create a css folder if not asked for" do
    capture_io([input: "awesomeco\nMax Power\ny\nn"], website_generator)
    refute File.exists?("awesomeco/css")
  end
end
