defmodule Samacare.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :message, :string, size: 140
      add :private, :boolean, default: false, null: false
      # add :tweeted_at, :utc_datetime_usec
      add :author_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tweets, [:author_id])
  end
end
