defmodule Samacare.Repo.Migrations.CreateTestReds do
  use Ecto.Migration

  def change do
    create table(:test_reds) do
      add :name, :string
      add :age, :integer
      add :birthdate, :date
      add :active_at, :naive_datetime

      timestamps()
    end

  end
end
