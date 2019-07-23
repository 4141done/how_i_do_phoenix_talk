defmodule GetTogather.Storage do
  use GenServer

  @moduledoc """
  Simple GenServer-based in-memory state_holder.  This is only here so
  we can avoid talking about databases.  Probably never copy this for anything.
  """

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(initial_state) do
    {:ok, initial_state}
  end

  def add_to_resource(resource_name, to_add) do
    GenServer.call(__MODULE__, {:add, {resource_name, to_add}})
  end

  def get_resource(resource_name) do
    GenServer.call(__MODULE__, {:get, resource_name})
  end

  def handle_call({:add, {resource_name, to_add}}, _from, state) do
    new_list =
      state
      |> Map.get(resource_name, [])
      |> (&[to_add | &1]).()

    {:reply, new_list, Map.put(state, resource_name, new_list)}
  end

  def handle_call({:get, resource_name}, _from, state) do
    {:reply, Map.get(state, resource_name), state}
  end
end
