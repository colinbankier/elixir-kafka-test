defmodule ElixirKafkaTest.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_kafka_test,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger, :kafka]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:kafka, git: "https://github.com/EnvisionX/erlang-kafka", branch: "master", compile: "make compile"}
      # {:mps, git: "https://github.com/colinbankier/mps", ref: "remove_riak_2"},
      # {:mps, git: "https://github.com/milindparikh/mps", ref: "6bd9084af186e197d365a83cbd8015e1649a56d5"},
      # {:riak_core, git: "git://github.com/basho/riak_core", tag: "2.0.0", override: true},
      # {:cowboy, git: "git://github.com/extend/cowboy", tag: "1.0.0", override: true},
      # {:poolboy, git: "git://github.com/devinus/poolboy", tag: "1.4.0", override: true},
      # {:meck, git: "git://github.com/eproxus/meck", tag: "0.8.2", override: true},
      # {:folsom, git: "git://github.com/boundary/folsom", tag: "0.8.1", override: true},
      # {:mochiweb, git: "git://github.com/basho/mochiweb", tag: "1.5.1p7", override: true},
      # {:webmachine, git: "git://github.com/basho/webmachine", tag: "1.10.6", override: true},
    ]
  end
end
