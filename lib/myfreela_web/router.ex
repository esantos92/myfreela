defmodule MyfreelaWeb.Router do
  use MyfreelaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug MyfreelaWeb.Auth.Pipeline
  end

  scope "/api", MyfreelaWeb do
    pipe_through :api
    scope "/user" do
      post("/signup", UsersController, :create)
      post("/signin", UsersController, :sign_in)
    end
  end

  scope "/api", MyfreelaWeb do
    pipe_through :api
    pipe_through :auth

    scope "/user" do
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

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: MyfreelaWeb.Telemetry
    end
  end
end
