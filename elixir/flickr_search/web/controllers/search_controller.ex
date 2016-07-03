defmodule FlickrSearch.SearchController do
  use FlickrSearch.Web, :controller
  require Logger

  def index(conn, _params) do
    photos = fetch_photos
    Logger.debug photos
    render conn, "index.html"
  end

  defp fetch_photos do
    http_client = HTTPotion
    http_client.start
    http_client.get("https://api.flickr.com/services/feeds/photos_public.gne?tag=cat").body
  end
end
