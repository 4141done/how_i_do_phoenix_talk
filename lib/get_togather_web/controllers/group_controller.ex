defmodule GetTogatherWeb.GroupController do
  use GetTogatherWeb, :controller
  alias GetTogather.Meetups
  alias GetTogather.Meetups.Group
  alias GetTogatherWeb.GroupShowParams, as: ShowParams

  action_fallback GetTogatherWeb.FallbackController

  def index(conn, _params) do
    render(conn, "index.json", groups: Meetups.list_groups())
  end

  def show(conn, params) do
    changeset = ShowParams.changeset(%ShowParams{}, params)
    with {:params_valid, true} <- {:params_valid, changeset.valid?},
         {:id_fetch, {:changes, id}} <- {:id_fetch, Ecto.Changeset.fetch_field(changeset, :id)},
         %Group{} = group <- Meetups.get_group(id) do

      render(conn, "show.json", group: group)

    else
      {:params_valid, false} ->
        {:error, changeset}
      {:id_fetch, :error} ->
        # This will never be hit because ecto makes sure that the id must be present and an integer
        {:error, "Id must be an integer"}
      error ->
        {:error, inspect(error)}
    end
  end
end