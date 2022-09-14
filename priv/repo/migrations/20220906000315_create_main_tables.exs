defmodule Myfreela.Repo.Migrations.CreateMainTables do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password_hash, :string

      timestamps()
    end

    create table(:profiles) do
      add :user_id, references(:users, type: :integer, on_delete: :delete_all)
      add :github_username, :string
      add :monthly_budget, :decimal
      add :value_hour, :decimal
      add :days_per_week, :integer
      add :hours_per_day, :integer
      add :vacation_per_year, :integer

      timestamps()
    end

    create table(:jobs) do
      add :profile_id, references(:profiles, type: :integer, on_delete: :delete_all)
      add :title, :string
      add :daily_hours, :integer
      add :total_hours, :integer

      timestamps()
    end
  end
end
