defmodule GrabbingWeatherTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest GrabbingWeather

  test "shows weather in Chicago" do
    grabbing_weather = fn -> GrabbingWeather.CLI.main([FakeHttpClient]) end
    assert capture_io([input: "Chicago"], grabbing_weather) ==
    "Where are you? Chicago weather: 65 degrees Farenheit\n"
  end
end

defmodule FakeHttpClient do
  def start do
  end

  def get(_url) do
    %{body: weather_data}
  end

  defp weather_data do
    """
    {
    "main":
      {
        "temp": 291.5
      }
    }
    """
  end
end
