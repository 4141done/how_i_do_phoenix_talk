defmodule Status.InspectionPlug do
  import Plug.Conn

  def init(opts) do
    opts
  end

  def call(conn, opts) do
    IO.inspect(conn, label: "PLUG INSPECT: #{inspect(Keyword.get(opts, :position, ""))}" )
  end
end