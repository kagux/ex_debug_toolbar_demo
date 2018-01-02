use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex_debug_toolbar_demo, ExDebugToolbarDemo.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ex_debug_toolbar_demo, ExDebugToolbarDemo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "demo",
  password: "pass",
  database: "demo",
  hostname: System.get_env("DB_HOST") || "postgresql",
  pool: Ecto.Adapters.SQL.Sandbox
