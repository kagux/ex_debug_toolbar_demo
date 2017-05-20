defmodule ExDebugToolbarDemo.Router do
  use ExDebugToolbarDemo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ExDebugToolbarDemo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/ecto", PageController, :ecto
  end

  forward "/__ex_debug_toolbar__", ExDebugToolbar.Endpoint
end
