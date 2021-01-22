defmodule Samacare.Repo.Migrations.CreateTestGreens do
  use Ecto.Migration

  def change do
    create table(:test_greens) do
      add :name, :string, null: false
      add :count, :integer, null: false
      add :test_red_id, references(:test_reds, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:test_greens, [:test_red_id])
  end
end
