defmodule EctoBug.Repo.Migrations.CreateReads do
  use Ecto.Migration

  def change do
    create table(:reads) do
      add :read_at, :naive_datetime
      add :post_id, references(:posts, on_delete: :nothing)

      timestamps()
    end

    create index(:reads, [:post_id])
  end
end
