defmodule Nvrforget.Repo do
  use Ecto.Repo,
    otp_app: :nvrforget,
    adapter: Ecto.Adapters.Postgres
end
