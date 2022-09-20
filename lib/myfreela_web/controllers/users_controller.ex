defmodule MyfreelaWeb.UsersController do
  use MyfreelaWeb, :controller

  alias MyfreelaWeb.Auth.Guardian

  action_fallback MyfreelaWeb.FallbackController

  def create(conn, params) do
    with {:ok, user} <- Myfreela.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("create.json", %{user: user, token: token,})
    end
    # params
    # |> Myfreela.create_user()
    # |> handle_response(conn, "create.json", :created)
  end

  def sign_in(conn, params) do
    with {:ok, token, user} <- Guardian.authenticate(params) do
      conn
      |> put_status(:ok)
      |> render("sign_in.json", token: token, user: user)
    end
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
