defmodule Samacare.Posts.Follow do
  use Ecto.Schema
  import Ecto.Changeset

  alias Samacare.Posts.User

  schema "follows" do
    field :deleted_at, :naive_datetime
    # field :follower_id, :id
    belongs_to :follower, User
    # field :followee_id, :id
    belongs_to :followee, User

    timestamps()
  end

  @doc false
  def changeset(follow, attrs) do
    follow
    |> cast(attrs, [:deleted_at, :follower_id, :followee_id])
    |> validate_required([:follower_id, :followee_id])
    |> unique_constraint(:follower, name: :follows_followee_id_follower_id_index)
    # |> validate_required([:deleted_at])
  end
end
