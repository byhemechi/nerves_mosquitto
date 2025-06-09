defmodule NervesMosquitto.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, args) do
    children = [
      {MuonTrap.Daemon,
       [
         Path.join(:code.priv_dir(:nerves_mosquitto), "binaries/mosquitto"),
         args,
         []
       ]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: NervesMosquitto.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
