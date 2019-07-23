defmodule GetTogatherWeb.GroupController do
  use GetTogatherWeb, :controller
  alias GetTogather.Meetups

  def index(conn, _params) do
    render(conn, "index.json", groups: Meetups.list_groups())
  end
end