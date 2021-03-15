# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nvrforget,
  ecto_repos: [Nvrforget.Repo]

# Configures the endpoint
config :nvrforget, NvrforgetWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "K9rkf4ROKiM6U0XS/TTlBWLzFeA3tcPvpqjGJFiUeKT/AYuek1mfaRAiYEVorK5O",
  render_errors: [view: NvrforgetWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Nvrforget.PubSub,
  live_view: [signing_salt: "DBGZxW/+"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
