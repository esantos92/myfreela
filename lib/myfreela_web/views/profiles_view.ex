defmodule MyfreelaWeb.ProfilesView do
  use MyfreelaWeb, :view

  alias Myfreela.Profile

  def render("show.json", %{
        profile: %Profile{
          id: id,
          github_username: github_username,
          monthly_budget: monthly_budget,
          days_per_week: days_per_week,
          hours_per_day: hours_per_day,
          vacation_per_year: vacation_per_year,
          value_hour: value_hour
        }
      }) do
    %{
      id: id,
      github_username: github_username,
      monthly_budget: monthly_budget,
      days_per_week: days_per_week,
      hours_per_day: hours_per_day,
      vacation_per_year: vacation_per_year,
      value_hour: value_hour
    }
  end

  def render("update.json", %{
    profile: %Profile{
      id: id,
      github_username: github_username,
      monthly_budget: monthly_budget,
      days_per_week: days_per_week,
      hours_per_day: hours_per_day,
      vacation_per_year: vacation_per_year,
      value_hour: value_hour
    }
  }) do
    %{
      message: "Profile updated",
      profile: %{
        id: id,
        github_username: github_username,
        monthly_budget: monthly_budget,
        days_per_week: days_per_week,
        hours_per_day: hours_per_day,
        vacation_per_year: vacation_per_year,
        value_hour: value_hour
      }
    }
  end
end
