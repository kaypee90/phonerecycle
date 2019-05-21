# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phone_recycle,
  ecto_repos: [PhoneRecycle.Repo]

# Configures the endpoint
config :phone_recycle, PhoneRecycle.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZDtwodH8M/CSlO6bxKMwUjx52wXLBENBXXQ4gRmys2jIlWmeLZ381zmFkP6Wmddq",
  render_errors: [view: PhoneRecycle.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoneRecycle.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
