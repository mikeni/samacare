defmodule Samacare.Posts.Tweet do
  use Ecto.Schema
  import Ecto.Changeset
  alias Samacare.Posts.User

  schema "tweets" do
    field :message, :string
    field :private, :boolean, default: false
    # field :tweeted_at, :utc_datetime_usec
    # field :author_id, :id
    belongs_to :author, User, references: :id

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:message, :private, :author_id])
    |> validate_required([:message, :author_id])
    |> validate_length(:message, min: 1, max: 140)
  end
end
