defmodule Myfreela.Job.Get do
  alias Myfreela.{Repo, Job}

  def call(id) do
    id
    |> get()
  end

  defp get(id) do
    case Repo.get(Job, id) do
      nil -> {:error, "Job not found"}
      job -> {:ok, job}
    end
  end
end
