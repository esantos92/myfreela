defmodule Myfreela.User.Create do
  alias Myfreela.{Profile, Repo, User}
  alias Ecto.Multi

  def call(params) do
    Multi.new()
    |> Multi.insert(:create_user, User.changeset(params))
    |> Multi.run(:create_profile, fn repo, %{create_user: user} ->
      insert_profile(repo, user)
    end)
    |> Multi.run(:preload_data, fn repo, %{create_user: user} ->
      preload_data(repo, user)
    end)
    |> run_transaction()
  end

  defp insert_profile(repo, user) do
    user.id
    |> profile_changeset()
    |> repo.insert()
  end

  defp profile_changeset(user_id) do
    params = %{
      github_username: "Insira seu github",
      monthly_budget: "0.00",
      value_hour: "0.00",
      days_per_week: 5,
      hours_per_day: 8,
      vacation_per_year: 30,
      user_id: user_id
    }

    Profile.changeset(params)
  end

  defp preload_data(repo, user) do
    {:ok, repo.preload(user, :profile)}
  end

  defp run_transaction(multi) do
    case Repo.transaction(multi) do
      {:error, _operation, reason, _changes} -> {:error, reason}
      {:ok, %{preload_data: user}} -> {:ok, user}
    end
  end
end
