defmodule Myfreela.Job.Delete do
  alias Myfreela.{Repo, Job}

  def call(id) do
    id
    |> delete()
  end

  defp delete(id) do
    case fetch_job(id) do
      nil -> {:error, "Job not found"}
      job -> Repo.delete(job)
    end
  end

  defp fetch_job(id), do: Repo.get(Job, id)
end
