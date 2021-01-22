defmodule Samacare.Repo do
  use Ecto.Repo,
    otp_app: :samacare,
    adapter: Ecto.Adapters.Postgres
end
