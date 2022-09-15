defmodule MyfreelaWeb.Router do
  use MyfreelaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyfreelaWeb do
    pipe_through :api
    resources "/user", UsersController, only: [:create, :show]
    resources "/profile", ProfilesController, only: [:show, :update]
    resources "/jobs", JobsController, only: [:create, :show, :update, :delete]
    # resources "/profile/jobs", JobsController, only: [:index]
    scope "/jobs" do
      get("/index_jobs/:id", JobsController, :index)
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: MyfreelaWeb.Telemetry
    end
  end
end
