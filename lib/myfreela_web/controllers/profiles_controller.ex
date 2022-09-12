defmodule MyfreelaWeb.ProfilesController do
  use MyfreelaWeb, :controller

  action_fallback MyfreelaWeb.FallbackController

  def show(conn, %{"id" => id}) do
    id
    |> Myfreela.fetch_profile()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> Myfreela.update_profile()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_response({:ok, profile}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, profile: profile)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
