defmodule SamacareWeb.TestRedControllerTest do
  use SamacareWeb.ConnCase

  alias Samacare.TestColors
  alias Samacare.TestColors.TestRed

  @create_attrs %{
    active_at: ~N[2010-04-17 14:00:00],
    age: 42,
    birthdate: ~D[2010-04-17],
    name: "some name"
  }
  @update_attrs %{
    active_at: ~N[2011-05-18 15:01:01],
    age: 43,
    birthdate: ~D[2011-05-18],
    name: "some updated name"
  }
  @invalid_attrs %{active_at: nil, age: nil, birthdate: nil, name: nil}

  def fixture(:test_red) do
    {:ok, test_red} = TestColors.create_test_red(@create_attrs)
    test_red
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all test_reds", %{conn: conn} do
      conn = get(conn, Routes.test_red_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create test_red" do
    test "renders test_red when data is valid", %{conn: conn} do
      conn = post(conn, Routes.test_red_path(conn, :create), test_red: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.test_red_path(conn, :show, id))

      assert %{
               "id" => id,
               "active_at" => "2010-04-17T14:00:00",
               "age" => 42,
               "birthdate" => "2010-04-17",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.test_red_path(conn, :create), test_red: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update test_red" do
    setup [:create_test_red]

    test "renders test_red when data is valid", %{conn: conn, test_red: %TestRed{id: id} = test_red} do
      conn = put(conn, Routes.test_red_path(conn, :update, test_red), test_red: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.test_red_path(conn, :show, id))

      assert %{
               "id" => id,
               "active_at" => "2011-05-18T15:01:01",
               "age" => 43,
               "birthdate" => "2011-05-18",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, test_red: test_red} do
      conn = put(conn, Routes.test_red_path(conn, :update, test_red), test_red: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete test_red" do
    setup [:create_test_red]

    test "deletes chosen test_red", %{conn: conn, test_red: test_red} do
      conn = delete(conn, Routes.test_red_path(conn, :delete, test_red))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.test_red_path(conn, :show, test_red))
      end
    end
  end

  defp create_test_red(_) do
    test_red = fixture(:test_red)
    %{test_red: test_red}
  end
end
