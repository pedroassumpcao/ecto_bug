defmodule EctoBug.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field(:title, :string)
    has_many(:comments, EctoBug.Blog.Comment)
    has_many(:reads, EctoBug.Blog.Read)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
