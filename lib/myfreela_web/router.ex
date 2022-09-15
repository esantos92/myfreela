defmodule MyfreelaWeb.Router do
  use MyfreelaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MyfreelaWeb do
    pipe_through :api
    scope "/user" do
      post("/", UsersController, :create)
      get("/:id", UsersController, :show)
    end

    scope "/profile" do
      get("/:id", ProfilesController, :show)
      put("/:id", ProfilesController, :update)
    end

    scope "/jobs" do
      post("/", JobsController, :create)
      get("/index_jobs/:profile_id", JobsController, :index)
      get("/:id", JobsController, :show)
      put("/:id", JobsController, :update)
      delete("/:id", JobsController, :delete)
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
