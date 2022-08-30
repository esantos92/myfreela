defmodule Myfreela.Repo.Migrations.CreateProfileTable do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :user_id, references(:users)
      add :github_username, :string
      add :monthly_budget, :decimal
      add :value_hour, :decimal
      add :days_per_week, :integer
      add :hours_per_day, :integer
      add :vacation_per_year, :integer

      timestamps()
    end
  end
end
