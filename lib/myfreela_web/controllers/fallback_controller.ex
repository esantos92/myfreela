defmodule MyfreelaWeb.FallbackController do
  use MyfreelaWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(MyfreelaWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
