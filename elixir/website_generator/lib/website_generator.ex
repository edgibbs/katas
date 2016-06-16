defmodule WebsiteGenerator do
  defmodule CLI do
    def main(_args) do
      site_name = IO.gets("Site name: ") |> String.strip
      author = IO.gets("Author: ") |> String.strip
      javascript_folder = IO.gets("Do you want a folder for Javascript? ") |> String.strip
      css_folder = IO.gets("Do you want a folder for CSS? ") |> String.strip

    end
  end
end
