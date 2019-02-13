# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :we_eat,
  ecto_repos: [WeEat.Repo]

# Configures the endpoint
config :we_eat, WeEatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BlXQJQpQG2Re/xB1v0Lw6kfVKFNMYxZyNTFmBMKjVPQsULRI2qGh8sDZkYwGFqk9",
  render_errors: [view: WeEatWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WeEat.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
