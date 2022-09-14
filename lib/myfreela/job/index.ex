defmodule Myfreela.Job.Index do
  alias Myfreela.{Profile, Repo}

  def call(profile_id) do
    with {:ok, profile} <- fetch_profile(profile_id) do
      profile
      |> index_jobs()
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

  defp index_jobs(profile) do
    jobs_list = Repo.preload(profile, :jobs).jobs
    if Enum.empty?(jobs_list) do
      {:error, "None job for this profile"}
    else
      {:ok, jobs_list}
    end
  end
end
