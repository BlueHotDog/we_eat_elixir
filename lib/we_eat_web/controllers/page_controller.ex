defmodule WeEatWeb.PageController do
  use WeEatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
