# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the namespace used by Phoenix generators
config :elixir_pokemon,
  app_namespace: EP

# Configures the endpoint
config :elixir_pokemon, EP.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "5/j82dXT2nKRU0F0X7FPFEkKM1ym3Y22SDmyQGGwYWza8y4BDX4q0j3YyQ8Uljgq",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: EP.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false
