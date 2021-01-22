defmodule Samacare.TestColors do
  @moduledoc """
  The TestColors context.
  """

  import Ecto.Query, warn: false
  alias Samacare.Repo

  alias Samacare.TestColors.TestRed

  @doc """
  Returns the list of test_reds.

  ## Examples

      iex> list_test_reds()
      [%TestRed{}, ...]

  """
  def list_test_reds do
    Repo.all(TestRed)
  end

  @doc """
  Gets a single test_red.

  Raises `Ecto.NoResultsError` if the Test red does not exist.

  ## Examples

      iex> get_test_red!(123)
      %TestRed{}

      iex> get_test_red!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test_red!(id), do: Repo.get!(TestRed, id)

  @doc """
  Creates a test_red.

  ## Examples

      iex> create_test_red(%{field: value})
      {:ok, %TestRed{}}

      iex> create_test_red(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test_red(attrs \\ %{}) do
    %TestRed{}
    |> TestRed.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test_red.

  ## Examples

      iex> update_test_red(test_red, %{field: new_value})
      {:ok, %TestRed{}}

      iex> update_test_red(test_red, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test_red(%TestRed{} = test_red, attrs) do
    test_red
    |> TestRed.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a test_red.

  ## Examples

      iex> delete_test_red(test_red)
      {:ok, %TestRed{}}

      iex> delete_test_red(test_red)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test_red(%TestRed{} = test_red) do
    Repo.delete(test_red)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test_red changes.

  ## Examples

      iex> change_test_red(test_red)
      %Ecto.Changeset{data: %TestRed{}}

  """
  def change_test_red(%TestRed{} = test_red, attrs \\ %{}) do
    TestRed.changeset(test_red, attrs)
  end

  alias Samacare.TestColors.TestGreen

  @doc """
  Returns the list of test_greens.

  ## Examples

      iex> list_test_greens()
      [%TestGreen{}, ...]

  """
  def list_test_greens do
    Repo.all(TestGreen)
  end

  @doc """
  Gets a single test_green.

  Raises `Ecto.NoResultsError` if the Test green does not exist.

  ## Examples

      iex> get_test_green!(123)
      %TestGreen{}

      iex> get_test_green!(456)
      ** (Ecto.NoResultsError)

  """
  def get_test_green!(id), do: Repo.get!(TestGreen, id)

  @doc """
  Creates a test_green.

  ## Examples

      iex> create_test_green(%{field: value})
      {:ok, %TestGreen{}}

      iex> create_test_green(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_test_green(attrs \\ %{}) do
    %TestGreen{}
    |> TestGreen.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a test_green.

  ## Examples

      iex> update_test_green(test_green, %{field: new_value})
      {:ok, %TestGreen{}}

      iex> update_test_green(test_green, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_test_green(%TestGreen{} = test_green, attrs) do
    test_green
    |> TestGreen.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a test_green.

  ## Examples

      iex> delete_test_green(test_green)
      {:ok, %TestGreen{}}

      iex> delete_test_green(test_green)
      {:error, %Ecto.Changeset{}}

  """
  def delete_test_green(%TestGreen{} = test_green) do
    Repo.delete(test_green)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking test_green changes.

  ## Examples

      iex> change_test_green(test_green)
      %Ecto.Changeset{data: %TestGreen{}}

  """
  def change_test_green(%TestGreen{} = test_green, attrs \\ %{}) do
    TestGreen.changeset(test_green, attrs)
  end
end
