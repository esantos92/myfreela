defmodule Myfreela.Job.Create do
  alias Myfreela.{Job, Profile, Repo}

  def call(%{"profile_id" => profile_id} = params) do
    with {:ok, _profile} <- fetch_profile(profile_id) do
      params
      |> Job.build()
      |> create_job()
    else
      {:error, "Not found profile"} -> {:error, "none profile for this id"}
    end
  end

  defp fetch_profile(profile_id) do
    case Repo.get(Profile, profile_id) do
      nil -> {:error, "Not found profile"}
      profile -> {:ok, profile}
    end
  end

  defp create_job({:ok, struct}), do: Repo.insert(struct)
  defp create_job({:error, _changeset} = error), do: error
end
