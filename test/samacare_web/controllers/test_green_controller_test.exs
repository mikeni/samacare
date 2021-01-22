defmodule SamacareWeb.TestGreenControllerTest do
  use SamacareWeb.ConnCase

  alias Samacare.TestColors
  alias Samacare.TestColors.TestGreen

  @create_attrs %{
    count: 42,
    name: "some name"
  }
  @update_attrs %{
    count: 43,
    name: "some updated name"
  }
  @invalid_attrs %{count: nil, name: nil}

  def fixture(:test_green) do
    {:ok, test_green} = TestColors.create_test_green(@create_attrs)
    test_green
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all test_greens", %{conn: conn} do
      conn = get(conn, Routes.test_green_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create test_green" do
    test "renders test_green when data is valid", %{conn: conn} do
      conn = post(conn, Routes.test_green_path(conn, :create), test_green: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.test_green_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 42,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.test_green_path(conn, :create), test_green: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update test_green" do
    setup [:create_test_green]

    test "renders test_green when data is valid", %{conn: conn, test_green: %TestGreen{id: id} = test_green} do
      conn = put(conn, Routes.test_green_path(conn, :update, test_green), test_green: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.test_green_path(conn, :show, id))

      assert %{
               "id" => id,
               "count" => 43,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, test_green: test_green} do
      conn = put(conn, Routes.test_green_path(conn, :update, test_green), test_green: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete test_green" do
    setup [:create_test_green]

    test "deletes chosen test_green", %{conn: conn, test_green: test_green} do
      conn = delete(conn, Routes.test_green_path(conn, :delete, test_green))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.test_green_path(conn, :show, test_green))
      end
    end
  end

  defp create_test_green(_) do
    test_green = fixture(:test_green)
    %{test_green: test_green}
  end
end
