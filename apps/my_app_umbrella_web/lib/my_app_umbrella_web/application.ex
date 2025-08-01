defmodule MyAppUmbrellaWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyAppUmbrellaWeb.Telemetry,
      # Start a worker by calling: MyAppUmbrellaWeb.Worker.start_link(arg)
      # {MyAppUmbrellaWeb.Worker, arg},
      # Start to serve requests, typically the last entry
      MyAppUmbrellaWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyAppUmbrellaWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MyAppUmbrellaWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
