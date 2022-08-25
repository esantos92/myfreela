defmodule MyfreelaWeb.UsersController do
  use MyfreelaWeb, :controller

  action_fallback MyfreelaWeb.FallbackController

  def create(conn, params) do
    params
    |> Myfreela.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end

  defp handle_response({:error, _changeset} = error, _conn), do: error
end
