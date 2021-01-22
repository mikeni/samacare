defmodule Samacare.TestColors.TestGreen do
  use Ecto.Schema
  import Ecto.Changeset
  alias Samacare.TestColors.TestRed

  schema "test_greens" do
    field :count, :integer
    field :name, :string
    # field :test_red_id, :id
    belongs_to :test_red, TestRed

    timestamps()
  end

  @doc false
  def changeset(test_green, attrs) do
    test_green
    |> cast(attrs, [:name, :count, :test_red_id])
    |> validate_required([:name, :count, :test_red_id])
  end
end
