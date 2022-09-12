defmodule Myfreela.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  alias Myfreela.{Job, User}

  schema "profiles" do
    field :github_username, :string
    field :monthly_budget, :decimal
    field :value_hour, :decimal
    field :days_per_week, :integer
    field :hours_per_day, :integer
    field :vacation_per_year, :integer
    timestamps()

    belongs_to :user, User
    has_many :jobs, Job
  end

  @required_params [:github_username, :monthly_budget, :value_hour, :days_per_week, :hours_per_day, :vacation_per_year, :user_id]

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(profile, params), do: create_changeset(profile, params)

  defp create_changeset(module_or_profile, params) do
    module_or_profile
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_inclusion(:days_per_week, 1..7)
    |> validate_inclusion(:hours_per_day, 1..12)
    |> validate_inclusion(:vacation_per_year, 1..30)
  end
end
