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
    get "/partials", PageController, :partials
    get "/pry", PageController, :pry
    get "/js", PageController, :javascript
    get "/error", PageController, :error
    get "/slim", PageController, :slim
    get "/json", PageController, :json
    get "/bootstrap_4", PageController, :bootstrap_4
    get "/params/:route_param", PageController, :params
  end
end
