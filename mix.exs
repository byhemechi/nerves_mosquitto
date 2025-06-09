defmodule NervesMosquitto.MixProject do
  use Mix.Project

  def project do
    [
      app: :nerves_mosquitto,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:elixir_make] ++ Mix.compilers(),
      make_targets: ["build", "copy"],
      make_clean: ["clean"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {NervesMosquitto.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:muontrap, "~> 1.6"},
      {:mosquitto,
       git: "https://github.com/eclipse-mosquitto/mosquitto",
       tag: "v2.0.21",
       app: false,
       compile: false,
       only: :dev},
      {:elixir_make, "~> 0.9.0"}
    ]
  end
end
