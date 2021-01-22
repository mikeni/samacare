defmodule SamacareWeb.PageController do
  use SamacareWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
