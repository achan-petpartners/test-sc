use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :score_card_service, ScoreCardServiceWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :score_card_service, :github_api, ScoreCardService.GitHub.InMemory

# Configure your database
config :score_card_service, ScoreCardService.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "score_card_service_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
