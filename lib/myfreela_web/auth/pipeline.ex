defmodule MyfreelaWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :myfreela

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
