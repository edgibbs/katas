defmodule GrabbingWeather do
  defmodule CLI do
    @api_key "4b9b365e00166a6d0a147ff524e25ea7"
    @account_id "elixir_kata"

    def main(args) do
      city = IO.gets("Where are you? ") |> String.strip
      fetch_city_weather(args, city)
        |> Poison.Parser.parse!
        |> temperature_in_kelvin
        |> convert_to_farenheit
        |> print_results(city)
    end

    defp print_results(temperature_farenheit, city) do
      IO.puts "#{city} weather: #{temperature_farenheit} degrees Farenheit"
    end

    defp fetch_city_weather(args, city) do
      http_client = List.first(args) || HTTPotion
      http_client.start
      http_client.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{@api_key}").body
    end

    defp temperature_in_kelvin(json_result) do
      json_result["main"]["temp"]
    end

    defp convert_to_farenheit(temp_kelvin) do
      (temp_kelvin - 273) * (9/5) + 32 |> round
    end
  end
end
