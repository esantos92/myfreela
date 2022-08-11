defmodule Myfreela.Repo do
  use Ecto.Repo,
    otp_app: :myfreela,
    adapter: Ecto.Adapters.Postgres
end
