defmodule ProductSearchTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ProductSearch

  test "can find a product" do
    product_search = fn -> ProductSearch.CLI.main(nil) end
    assert capture_io([input: "iPad\nWidget"], product_search) ==
    """
    What is the product name? 
    """
  end
end
