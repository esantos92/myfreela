defmodule Myfreela.User.Get do
  alias Myfreela.{Repo, User}

  def call(id) do
    id
    |> get()
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
