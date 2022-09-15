defmodule MyfreelaWeb.JobsController do
  use MyfreelaWeb, :controller

  action_fallback MyfreelaWeb.FallbackController

  def create(conn, params) do
    params
    |> Myfreela.create_job()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> Myfreela.delete_job()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> Myfreela.fetch_job()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> Myfreela.update_job()
    |> handle_response(conn, "update.json", :ok)
  end

  def index(conn, %{"profile_id" => profile_id}) do
    with {:ok, jobs} <- Myfreela.index_jobs(profile_id) do
      conn
      |> put_status(:ok)
      |> render("index.json", jobs: jobs)
    end
  end

  defp handle_response({:ok, job}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, job: job)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

  defp handle_delete({:ok, _job}, conn) do
    conn
    |> put_status(:ok)
    |> text("Job deleted")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error
end
