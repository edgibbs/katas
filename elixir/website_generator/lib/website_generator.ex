defmodule WebsiteGenerator do
  defmodule CLI do
    def main(_args) do
      site_name = IO.gets("Site name: ") |> String.strip
      author = IO.gets("Author: ") |> String.strip
      javascript_folder = IO.gets("Do you want a folder for Javascript? ") |> String.strip
      css_folder = IO.gets("Do you want a folder for CSS? ") |> String.strip
      create_folder(site_name, "y")
      create_index_file(site_name, author)
      create_folder(site_name <> "/js", javascript_folder)
      create_folder(site_name <> "/css", css_folder)
    end

    defp create_folder(site_name, "y") do
      File.mkdir(site_name)
      IO.puts("Created ./#{site_name}")
    end

    defp create_folder(site_name, no) do end

    defp create_index_file(site_name, author) do
      {:ok, index_html} = File.open("#{site_name}/index.html", [:write])
      IO.binwrite(index_html,
      """
      <html>
      <head>
      <title>#{site_name}</title>
      <meta name="Author" content="#{author}">
      </head>
      <body>
      </body>
      </html>
      """
      )
      IO.puts("Created ./#{site_name}/index.html")
    end
  end
end
