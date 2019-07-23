defmodule GetTogather.Meetups do
  @moduledoc """
  The Meetups context.
  """
  alias GetTogather.Storage

  def list_groups() do
    Storage.get_resource(:groups)
    |> Enum.sort(fn g1, g2 -> g1.updated_at <= g2.updated_at end)
    |> Enum.take(3)
  end

  def get_group(id) do
    Storage.get_resource(:groups)
    |> Enum.find(fn group -> group.id == id end)
  end
end
