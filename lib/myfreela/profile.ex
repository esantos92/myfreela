defmodule Myfreela.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  alias Myfreela.User

  schema "profiles" do
    field :github_username, :string
    field :monthly_budget, :decimal
    field :value_hour, :decimal
    field :days_per_week, :integer
    field :hours_per_day, :integer
    field :vacation_per_year, :integer
    belongs_to :user, User

    timestamps()
  end

  @required_params [:github_username, :monthly_budget, :value_hour, :days_per_week, :hours_per_day, :vacation_per_year, :user_id]

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    # check_constraint()
  end
end
