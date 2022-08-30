defmodule Myfreela.User.Delete do
  alias Myfreela.{Repo, User}

  def call(id) do
    id
    |> delete()
  end

  defp delete(id) do
    case fetch_user(id) do
      nil -> {:error, "User not found"}
      user -> Repo.delete(user)
    end
  end

  defp fetch_user(id), do: Repo.get(User, id)
end
