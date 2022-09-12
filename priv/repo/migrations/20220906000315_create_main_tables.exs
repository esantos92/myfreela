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
      add :user_id, references(:users)
      add :github_username, :string
      add :monthly_budget, :decimal
      add :value_hour, :decimal
      add :days_per_week, :integer
      add :hours_per_day, :integer
      add :vacation_per_year, :integer

      timestamps()

      # create constraint(:profiles, :days_per_week_must_positive_and_less_or_equal_seven, check: "days_per_week > 0 && days_per_week <= 7")
      # create constraint(:profiles, :hours_per_day_must_be_positive_and_less_or_equal_twelve, check: "hours_per_day > 0 && hours_per_day <= 12")
      # create constraint(:profiles, :vacation_per_year_must_be_positive_and_less_or_equal_thirty, check: "vacation_per_year > 0 && <= 30")
    end

    create table(:jobs) do
      add :profile_id, references(:profiles)
      add :title, :string
      add :daily_hours, :integer
      add :total_hours, :integer

      timestamps()

      # create constraint(:jobs, :daily_hours_must_be_positive_and_less_or_equal_twelve, check: "daily_hours > 0 && daily_hours <= 12")
    end
  end
end
