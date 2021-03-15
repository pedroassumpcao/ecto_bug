defmodule EctoBug.PostTest do
  use EctoBug.DataCase

  alias EctoBug.Blog.{Comment, Post, Read}
  alias EctoBug.Repo

  setup do
    {:ok, post} =
      %Post{}
      |> Post.changeset(%{title: "Blog Title"})
      |> Repo.insert()

    {:ok, comment} =
      %Comment{}
      |> Comment.changeset(%{post_id: post.id, content: "Just a comment."})
      |> Repo.insert()

    {:ok, read} =
      %Read{}
      |> Read.changeset(%{post_id: post.id, read_at: NaiveDateTime.utc_now()})
      |> Repo.insert()

    %{post: post, comment: comment, read: read}
  end

  test "gets a post preloading the comments", %{post: post, comment: comment, read: read} do
    post_with_preloads =
      Post
      |> Repo.get(post.id)
      |> Repo.preload([:comments, :reads])

    assert comment in post_with_preloads.comments
    assert read in post_with_preloads.reads

    post_with_preloads_checkout =
      Repo.checkout(fn ->
        Post
        |> Repo.get(post.id)
        |> Repo.preload([:comments, :reads])
      end)

    assert comment in post_with_preloads_checkout.comments
    assert read in post_with_preloads_checkout.reads
  end
end
