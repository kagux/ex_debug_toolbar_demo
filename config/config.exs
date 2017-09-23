# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ex_debug_toolbar_demo,
  ecto_repos: [ExDebugToolbarDemo.Repo]

# Configures the endpoint
config :ex_debug_toolbar_demo, ExDebugToolbarDemo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o5OdUFBcDnP3e2nhJjSgAbALYWbLLRPF06FGVj22AVU/+ZXp795Y9f35+ntUUzHZ",
  render_errors: [view: ExDebugToolbarDemo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ExDebugToolbarDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  eex: Phoenix.Template.EExEngine,
  exs: Phoenix.Template.ExsEngine,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
