defmodule MyAppUmbrella.Repo do
  use Ecto.Repo,
    otp_app: :my_app_umbrella,
    adapter: Ecto.Adapters.Postgres
end
