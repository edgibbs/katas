defmodule FlickrSearch.SearchController do
  use FlickrSearch.Web, :controller
  import SweetXml
  require Logger

  def index(conn, params) do
    photos = fetch_photos |> Enum.take(3)
    small_photos = Enum.map(photos, fn(photo) -> Regex.replace(~r/_b/, to_string(photo), "_m") end)
    render conn, "index.html", photos: small_photos, query: params["q"]
  end

  defp fetch_photos do
    http_client = HTTPotion
    http_client.start
    http_client.get("https://api.flickr.com/services/feeds/photos_public.gne?tags=wizard").body
     |> xpath(~x"//entry/link[@rel='enclosure']/@href"l)
  end
end
