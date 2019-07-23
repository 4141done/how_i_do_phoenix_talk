defmodule GetTogatherWeb.FallbackController do
  use Phoenix.Controller
  alias GetTogatherWeb.ErrorView

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(ErrorView)
    |> render("404.json")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(ErrorView)
    |> render("422.json", changeset: changeset)
  end

  def call(conn, {:error, message}) do
    conn
    |> put_status(:internal_server_error)
    |> put_view(ErrorView)
    |> render("500.json", message: message)
  end
end