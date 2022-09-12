defmodule Myfreela.Job do
  use Ecto.Schema
  import Ecto.Changeset

  alias Myfreela.Profile

  schema "jobs" do
    field :title, :string
    field :daily_hours, :integer
    field :total_hours, :integer
    timestamps()

    belongs_to :profile, Profile
  end

  @required_params [:title, :daily_hours, :total_hours, :profile_id]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(job, params), do: create_changeset(job, params)

  defp create_changeset(module_or_job, params) do
    module_or_job
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_inclusion(:daily_hours, 1..12)
    |> foreign_key_constraint(:user, name: :jobs_user_id_fkey)
  end
end
