# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphql_sample,
  ecto_repos: [GraphqlSample.Repo]

# Configures the endpoint
config :graphql_sample, GraphqlSample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SVrI+1jNkcFFeq6lqlbbvlDuCsC0RCF6Crs6EYbudfJ3gPNeXNA+anGBy477i3fF",
  render_errors: [view: GraphqlSample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GraphqlSample.PubSub,
           adapter: Phoenix.PubSub.PG2]

#Configure mix docker 
config :mix_docker, image: "myapp"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
