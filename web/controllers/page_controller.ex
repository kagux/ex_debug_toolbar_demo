defmodule ExDebugToolbarDemo.PageController do
  use ExDebugToolbarDemo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", page_header: "Simple"
  end

  def ecto(conn, _params) do
    users = Repo.all(ExDebugToolbarDemo.User)
    conn
    |> assign(:users, users)
    |> assign(:page_header, "Ecto")
    |> render("ecto.html")
  end

  def partials(conn, _params) do
    render conn, "partials.html", page_header: "Partials"
  end
end
