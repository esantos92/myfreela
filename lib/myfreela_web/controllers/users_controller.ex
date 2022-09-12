defmodule MyfreelaWeb.UsersController do
  use MyfreelaWeb, :controller

  action_fallback MyfreelaWeb.FallbackController

  def create(conn, params) do
    params
    |> Myfreela.create_user()
    |> handle_response(conn, "create.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> Myfreela.fetch_user()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({:ok, user}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, user: user)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
