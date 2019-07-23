defmodule GetTogatherWeb.Router do
  use GetTogatherWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GetTogatherWeb do
    pipe_through :api
  end
end
