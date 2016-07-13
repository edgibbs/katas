defmodule TimeService.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(%{currentTime: time_format}))
  end

  defp time_format do
    {{year, month, day}, {hour, minute, second}} = :calendar.local_time()
    "#{year}-#{month}-#{day} #{hour}:#{minute}:#{second}"
  end
end
