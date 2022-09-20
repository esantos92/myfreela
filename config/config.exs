# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :myfreela,
  ecto_repos: [Myfreela.Repo]

# Configures the endpoint
config :myfreela, MyfreelaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "aazFox4CUAxlQ54m84k/KcNfsFbN0hfL/eJGCqP8/2RnRmWJdyxUritRaUddcaYp",
  render_errors: [view: MyfreelaWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Myfreela.PubSub,
  live_view: [signing_salt: "eLjwID7E"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :myfreela, MyfreelaWeb.Auth.Guardian,
       issuer: "myfreela",
       secret_key: "iWC/trQc6C22VAMMPQP38vQBciNg3l/lOAtO08+HIlEQ33nOOGX4wO6pELQ5xWS7"

config :myfreela, MyfreelaWeb.Auth.Pipeline,
  module: MyfreelaWeb.Auth.Guardian,
  error_handler: MyfreelaWeb.Auth.ErrorHandler
