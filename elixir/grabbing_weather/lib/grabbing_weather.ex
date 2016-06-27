defmodule GrabbingWeather do
  defmodule CLI do
    @api_key "4b9b365e00166a6d0a147ff524e25ea7"
    @account_id "elixir_kata"

    def main(args) do
      city = IO.gets("Where are you? ") |> String.strip
      http_client = List.first(args) || HTTPotion
      http_client.start
      response = http_client.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{@api_key}")
      json_result = Poison.Parser.parse!(response.body)
      temperature_kelvin = json_result["main"]["temp"]
      temperature_farenheit = (temperature_kelvin - 273) * (9/5) + 32 |> round
      IO.puts "#{city} weather: #{temperature_farenheit} degrees Farenheit"
    end
  end
end
