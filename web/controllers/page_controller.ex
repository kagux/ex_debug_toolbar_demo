defmodule ExDebugToolbarDemo.PageController do
  use ExDebugToolbarDemo.Web, :controller
  import Ecto.Query

  def index(conn, _params) do
    render conn, "index.html", page_header: "Simple"
  end

  def ecto(conn, _params) do
    id = 1
    users = ExDebugToolbarDemo.User |> where(id: ^id) |> Repo.all
    conn
    |> assign(:users, users)
    |> assign(:page_header, "Ecto")
    |> render("ecto.html")
  end

  def ecto_with_preload(conn, _params) do
    id = 1
    users = ExDebugToolbarDemo.User |> preload([:videos, :articles]) |> where(id: ^id) |> Repo.all
    conn
    |> assign(:users, users)
    |> assign(:page_header, "Ecto with Preload")
    |> render("ecto_with_preload.html")
  end

  def partials(conn, _params) do
    render conn, "partials.html", page_header: "Partials"
  end
end
