defmodule Hrfinal.Repo do
  use Ecto.Repo,
    otp_app: :hrfinal,
    adapter: Ecto.Adapters.Postgres
end
