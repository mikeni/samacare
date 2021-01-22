defmodule Samacare.TestColors.TestRed do
  use Ecto.Schema
  import Ecto.Changeset

  schema "test_reds" do
    field :active_at, :naive_datetime
    field :age, :integer
    field :birthdate, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(test_red, attrs) do
    test_red
    |> cast(attrs, [:name, :age, :birthdate, :active_at])
    |> validate_required([:name, :age, :birthdate, :active_at])
  end
end
