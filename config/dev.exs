use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :ex_debug_toolbar_demo, ExDebugToolbarDemo.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  reloadable_paths: ~w(web lib deps/ex_debug_toolbar),
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]

# Watch static and templates for browser reloading.
config :ex_debug_toolbar_demo, ExDebugToolbarDemo.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :ex_debug_toolbar_demo, ExDebugToolbarDemo.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "demo",
  password: "pass",
  database: "demo",
  hostname: "postgresql",
  pool_size: 10
  
# ExDebugToolbar config
# Instrumenters
config :ex_debug_toolbar,
  enable: true

config :ex_debug_toolbar_demo, ExDebugToolbarDemo.Endpoint,
  instrumenters: [ExDebugToolbar.Collector.InstrumentationCollector]

config :ex_debug_toolbar_demo, ExDebugToolbarDemo.Repo,
  loggers: [ExDebugToolbar.Collector.EctoCollector, Ecto.LogEntry]

