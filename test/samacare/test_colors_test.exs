defmodule Samacare.TestColorsTest do
  use Samacare.DataCase

  alias Samacare.TestColors

  describe "test_reds" do
    alias Samacare.TestColors.TestRed

    @valid_attrs %{active_at: ~N[2010-04-17 14:00:00], age: 42, birthdate: ~D[2010-04-17], name: "some name"}
    @update_attrs %{active_at: ~N[2011-05-18 15:01:01], age: 43, birthdate: ~D[2011-05-18], name: "some updated name"}
    @invalid_attrs %{active_at: nil, age: nil, birthdate: nil, name: nil}

    def test_red_fixture(attrs \\ %{}) do
      {:ok, test_red} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TestColors.create_test_red()

      test_red
    end

    test "list_test_reds/0 returns all test_reds" do
      test_red = test_red_fixture()
      assert TestColors.list_test_reds() == [test_red]
    end

    test "get_test_red!/1 returns the test_red with given id" do
      test_red = test_red_fixture()
      assert TestColors.get_test_red!(test_red.id) == test_red
    end

    test "create_test_red/1 with valid data creates a test_red" do
      assert {:ok, %TestRed{} = test_red} = TestColors.create_test_red(@valid_attrs)
      assert test_red.active_at == ~N[2010-04-17 14:00:00]
      assert test_red.age == 42
      assert test_red.birthdate == ~D[2010-04-17]
      assert test_red.name == "some name"
    end

    test "create_test_red/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TestColors.create_test_red(@invalid_attrs)
    end

    test "update_test_red/2 with valid data updates the test_red" do
      test_red = test_red_fixture()
      assert {:ok, %TestRed{} = test_red} = TestColors.update_test_red(test_red, @update_attrs)
      assert test_red.active_at == ~N[2011-05-18 15:01:01]
      assert test_red.age == 43
      assert test_red.birthdate == ~D[2011-05-18]
      assert test_red.name == "some updated name"
    end

    test "update_test_red/2 with invalid data returns error changeset" do
      test_red = test_red_fixture()
      assert {:error, %Ecto.Changeset{}} = TestColors.update_test_red(test_red, @invalid_attrs)
      assert test_red == TestColors.get_test_red!(test_red.id)
    end

    test "delete_test_red/1 deletes the test_red" do
      test_red = test_red_fixture()
      assert {:ok, %TestRed{}} = TestColors.delete_test_red(test_red)
      assert_raise Ecto.NoResultsError, fn -> TestColors.get_test_red!(test_red.id) end
    end

    test "change_test_red/1 returns a test_red changeset" do
      test_red = test_red_fixture()
      assert %Ecto.Changeset{} = TestColors.change_test_red(test_red)
    end
  end

  describe "test_greens" do
    alias Samacare.TestColors.TestGreen

    @valid_attrs %{count: 42, name: "some name"}
    @update_attrs %{count: 43, name: "some updated name"}
    @invalid_attrs %{count: nil, name: nil}

    def test_green_fixture(attrs \\ %{}) do
      {:ok, test_green} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TestColors.create_test_green()

      test_green
    end

    test "list_test_greens/0 returns all test_greens" do
      test_green = test_green_fixture()
      assert TestColors.list_test_greens() == [test_green]
    end

    test "get_test_green!/1 returns the test_green with given id" do
      test_green = test_green_fixture()
      assert TestColors.get_test_green!(test_green.id) == test_green
    end

    test "create_test_green/1 with valid data creates a test_green" do
      assert {:ok, %TestGreen{} = test_green} = TestColors.create_test_green(@valid_attrs)
      assert test_green.count == 42
      assert test_green.name == "some name"
    end

    test "create_test_green/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TestColors.create_test_green(@invalid_attrs)
    end

    test "update_test_green/2 with valid data updates the test_green" do
      test_green = test_green_fixture()
      assert {:ok, %TestGreen{} = test_green} = TestColors.update_test_green(test_green, @update_attrs)
      assert test_green.count == 43
      assert test_green.name == "some updated name"
    end

    test "update_test_green/2 with invalid data returns error changeset" do
      test_green = test_green_fixture()
      assert {:error, %Ecto.Changeset{}} = TestColors.update_test_green(test_green, @invalid_attrs)
      assert test_green == TestColors.get_test_green!(test_green.id)
    end

    test "delete_test_green/1 deletes the test_green" do
      test_green = test_green_fixture()
      assert {:ok, %TestGreen{}} = TestColors.delete_test_green(test_green)
      assert_raise Ecto.NoResultsError, fn -> TestColors.get_test_green!(test_green.id) end
    end

    test "change_test_green/1 returns a test_green changeset" do
      test_green = test_green_fixture()
      assert %Ecto.Changeset{} = TestColors.change_test_green(test_green)
    end
  end
end
