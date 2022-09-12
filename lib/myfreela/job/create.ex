defmodule Myfreela.Job.Create do
  alias Myfreela.{Job, Repo}

  def call(params) do
    params
    |> Job.build()
    |> create_job()
  end

  defp create_job({:ok, struct}), do: Repo.insert(struct)
  defp create_job({:error, _changeset} = error), do: error
end
