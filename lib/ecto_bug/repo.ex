defmodule EctoBug.Repo do
  use Ecto.Repo,
    otp_app: :ecto_bug,
    adapter: Ecto.Adapters.Postgres

  def default_options(operation) do
    case Mix.env() do
      :test -> super(operation) ++ [in_parallel: false]
      _env -> super(operation)
    end
  end
end
