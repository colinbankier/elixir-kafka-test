defmodule ElixirKafkaTest do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(TestApp.Worker, [arg1, arg2, arg3])
      opts = [
        {:aws_access_key_id, System.get_env("AWS_ACCESS_KEY")},
        {:aws_secret_secret_key, System.get_env("AWS_SECRET_KEY")},
        {:metadata_base_url, 'https://kinesis.us-east-1.amazonaws.com'}
      ]
      worker(:kinetic_sup, opts),
      worker(Worker, [])
    ]

    opts = [strategy: :one_for_one, name: Pipeline.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
