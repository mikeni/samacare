defmodule Samacare.Repo.Migrations.CreateFollows do
  use Ecto.Migration

  def change do
    create table(:follows) do
      add :deleted_at, :naive_datetime
      add :follower_id, references(:users, on_delete: :nothing), null: false
      add :followee_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create unique_index(:follows, [:followee_id, :follower_id])
  end
end
