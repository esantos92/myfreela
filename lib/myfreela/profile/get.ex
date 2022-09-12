defmodule Myfreela.Profile.Get do
  alias Myfreela.{Repo, Profile}

  def call(id) do
    id
    |> get()
  end

  defp get(id) do
    case Repo.get(Profile, id) do
      nil -> {:error, "Profile not found"}
      profile-> {:ok, profile}
    end
  end
end
