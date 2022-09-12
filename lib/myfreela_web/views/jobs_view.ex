defmodule MyfreelaWeb.JobsView do
  use MyfreelaWeb, :view

  alias Myfreela.Job

  def render("create.json", %{job: %Job{id: id, profile_id: profile_id, title: title, daily_hours: daily_hours, total_hours: total_hours, inserted_at: inserted_at}}) do
    %{
      message: "Job Created",
      job: %{
        id: id,
        profile_id: profile_id,
        title: title,
        daily_hours: daily_hours,
        total_hours: total_hours,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{job: %Job{id: id, profile_id: profile_id, title: title, daily_hours: daily_hours, total_hours: total_hours, inserted_at: inserted_at}}) do
    %{
      id: id,
      profile_id: profile_id,
      title: title,
      daily_hours: daily_hours,
      total_hours: total_hours,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{job: %Job{id: id, profile_id: profile_id, title: title, daily_hours: daily_hours, total_hours: total_hours, inserted_at: inserted_at}}) do
    %{
      message: "Job Updated",
      job: %{
        id: id,
        profile_id: profile_id,
        title: title,
        daily_hours: daily_hours,
        total_hours: total_hours,
        inserted_at: inserted_at
      }
    }
  end
end
