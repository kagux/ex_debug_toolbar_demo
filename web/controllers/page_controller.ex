defmodule ExDebugToolbarDemo.PageController do
  use ExDebugToolbarDemo.Web, :controller
  import Ecto.Query
  alias ExDebugToolbarDemo.User
  require ExDebugToolbar

  def index(conn, _params) do
    render conn, "index.html", page_header: "Simple"
  end

  def ecto(conn, _params) do
    User |> preload([:videos, :articles, images: :image_source]) |> where(id: 1) |> Repo.all
    ExDebugToolbarDemo.Repo.transaction(fn ->
      User |> Repo.stream |> Enum.to_list
    end)
    conn
    |> assign(:page_header, "Ecto")
    |> render("ecto.html")
  end

  def partials(conn, _params) do
    render conn, "partials.html", page_header: "Partials"
  end

  def pry(conn, _params) do
    _users = for _ <- 1..1000, do: %User{}
    ExDebugToolbar.pry
    render conn, "pry.html", page_header: "Pry"
  end

  def json(conn, _params) do
    render conn, "json.json"
  end

  def javascript(conn, _params) do
    render conn, "javascript.html", page_header: "Javascript"
  end

  def error(_conn, _params) do
    raise RuntimeError, "some runtime error"
  end

  def slim(conn, _params) do
    conn
    |> assign(:page_header, "Slim template")
    |> render("slim.html")
  end

  def bootstrap_4(conn, _params) do
    conn
    |> assign(:page_header, "Bootstrap 4")
    |> render("bootstrap_4.html")
  end

  def params(conn, %{"route_param" => route_param}) do
    conn
    |> assign(:page_header, "Params")
    |> assign(:route_param, route_param)
    |> assign(:query_params, conn.query_params)
    |> render("params.html")
  end
end
