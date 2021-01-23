defmodule Samacare.Posts.Tweet do
  use Ecto.Schema
  import Ecto.Changeset
  alias Samacare.Posts.User

  schema "tweets" do
    field :message, :string
    field :private, :boolean, default: false
    field :tweeted_at, :utc_datetime_usec
    # field :author_id, :id
    belongs_to :author, User, references: :id

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:message, :private, :tweeted_at, :author_id])
    |> validate_required([:message, :tweeted_at, :author_id])
  end
end
