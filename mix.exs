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
    [applications: [:logger, :kafka, :inets, :ssl]]
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
      {:kafka, git: "https://github.com/EnvisionX/erlang-kafka", branch: "master", compile: "make compile"},
      {:kinetic, git: "https://github.com/AdRoll/kinetic.git", branch: "master"},
    ]
  end
end
