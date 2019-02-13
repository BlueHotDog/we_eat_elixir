defmodule WeEat.Repo do
  use Ecto.Repo,
    otp_app: :we_eat,
    adapter: Ecto.Adapters.Postgres
end
