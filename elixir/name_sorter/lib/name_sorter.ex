defmodule NameSorter do
  defmodule CLI do
    def main(_args) do
      names = [
        %{last_name: "Ling", first_name: "Mai"},
        %{last_name: "Johnson", first_name: "Jim"},
        %{last_name: "Zarnecki", first_name: "Sabrina"},
        %{last_name: "Jones", first_name: "Chris"},
        %{last_name: "Jones", first_name: "Aaron"},
        %{last_name: "Swift", first_name: "Geoffrey"},
        %{last_name: "Xiong", first_name: "Fong"}
      ]
      sorted_names = Enum.sort(names, &(&2.last_name > &1.last_name))
      File.open!("names.txt", [:write])
        |> print_names(sorted_names)
        |> File.close
    end

    defp print_names(file, names) do
      IO.binwrite(file, "Total of #{Enum.count(names)} names\n----------------\n")
      Enum.map(names, fn(name) -> IO.binwrite(file, "#{name.last_name <> ", " <> name.first_name}\n") end)
    end
  end
end
