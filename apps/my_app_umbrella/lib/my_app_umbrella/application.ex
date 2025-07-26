defmodule MyAppUmbrella.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyAppUmbrella.Repo,
      {DNSCluster, query: Application.get_env(:my_app_umbrella, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MyAppUmbrella.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MyAppUmbrella.Finch}
      # Start a worker by calling: MyAppUmbrella.Worker.start_link(arg)
      # {MyAppUmbrella.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: MyAppUmbrella.Supervisor)
  end
end
