defmodule MyAppUmbrella.Umbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  defp deps do
    [
      # Required to run "mix format" on ~H/.heex files from the umbrella root
      {:igniter, "~> 0.6", only: [:dev, :test]},
      {:phoenix_live_view, ">= 0.0.0"}
    ]
  end

  defp aliases do
    [
      # run `mix setup` in all child apps
      setup: ["cmd mix setup"]
    ]
  end
end
