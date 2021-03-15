defmodule EctoBug.Blog.Read do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reads" do
    field :read_at, :naive_datetime
    field :post_id, :id

    timestamps()
  end

  @doc false
  def changeset(read, attrs) do
    read
    |> cast(attrs, [:read_at, :post_id])
    |> validate_required([:read_at, :post_id])
  end
end
