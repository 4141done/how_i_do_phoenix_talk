defmodule GetTogatherWeb.GroupController do
  use GetTogatherWeb, :controller
  use Params
  alias GetTogather.Meetups
  alias GetTogather.Meetups.Group

  action_fallback GetTogatherWeb.FallbackController

  def index(conn, _params) do
    render(conn, "index.json", groups: Meetups.list_groups())
  end

  defparams show_params %{
    id!: :integer
  }

  def show(conn, params) do
    changeset = show_params(params)
    with {:params_valid, true} <- {:params_valid, changeset.valid?},
         %{id: id} <- Params.to_map(changeset),
         %Group{} = group <- Meetups.get_group(id) do

      render(conn, "show.json", group: group)

    else
      {:params_valid, false} ->
        {:error, changeset}
      error ->
        {:error, inspect(error)}
    end
  end
end