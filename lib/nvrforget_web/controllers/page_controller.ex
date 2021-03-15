defmodule NvrforgetWeb.PageController do
  use NvrforgetWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
