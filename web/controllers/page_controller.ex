defmodule ExDebugToolbarDemo.PageController do
  use ExDebugToolbarDemo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
