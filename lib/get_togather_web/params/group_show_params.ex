defmodule GetTogatherWeb.GroupShowParams do
  use Ecto.Schema
  import Ecto.Changeset

  # Stolen Shamelessly from vic/params

  schema "groups show params" do
    # ID is implicit
  end

  def changeset(ch, params) do
    ch
    |> cast(params, [:id])
    |> validate_required([:id])
  end
end