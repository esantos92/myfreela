defmodule Myfreela.Profile.Update do
  alias Myfreela.{Repo, Profile}

  def call(%{"id" => id} = params) do
    case Repo.get(Profile, id) do
      nil -> {:error, "Profile not found"}
      profile -> update(profile, params)
    end
  end

  defp update(profile, params) do
    profile
    |> Profile.changeset(params)
    |> Repo.update()
  end
end
