defmodule Myfreela.Job.Update do
  alias Myfreela.{Repo, Job}

  def call(%{"id" => id} = params) do
    case Repo.get(Job, id) do
      nil -> {:error, "Job not found"}
      job -> update(job, params)
    end
  end

  defp update(job, params) do
    job
    |> Job.changeset(params)
    |> Repo.update()
  end
end
