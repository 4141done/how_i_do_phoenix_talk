defmodule GetTogatherWeb.Router do
  use GetTogatherWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GetTogatherWeb do
    pipe_through :api

    get "/groups", GroupController, :index
    get "/groups/:id", GroupController, :show
  end
end
