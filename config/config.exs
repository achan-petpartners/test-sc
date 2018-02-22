# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :score_card_service,
  ecto_repos: [ScoreCardService.Repo]

# Configures the endpoint
config :score_card_service, ScoreCardServiceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6OICgVGHjbICipZ668s6S1Zli+eFS8YrcIvfztN9BaAd722f9OXhfuRzY13OhTJS",
  render_errors: [view: ScoreCardServiceWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: ScoreCardService.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
