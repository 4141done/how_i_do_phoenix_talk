defmodule GetTogather.Meetups do
  @moduledoc """
  The Meetups context.
  """
  alias GetTogather.Storage

  def list_groups() do
    Storage.get_resource(:groups)
    |> Enum.sort(&(NaiveDateTime.compare(&1.updated_at, &2.updated_at) == :lt))
    |> Enum.take(3)
  end

  def get_group(id) do
    Storage.get_resource(:groups)
    |> Enum.find(fn group -> group.id == id end)
  end
end
