defmodule SamacareWeb.FollowControllerTest do
  use SamacareWeb.ConnCase

  alias Samacare.Posts
  alias Samacare.Posts.Follow

  @create_attrs %{
    deleted_at: ~N[2010-04-17 14:00:00]
  }
  @update_attrs %{
    deleted_at: ~N[2011-05-18 15:01:01]
  }
  @invalid_attrs %{deleted_at: nil}

  def fixture(:follow) do
    {:ok, follow} = Posts.create_follow(@create_attrs)
    follow
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all follows", %{conn: conn} do
      conn = get(conn, Routes.follow_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create follow" do
    test "renders follow when data is valid", %{conn: conn} do
      conn = post(conn, Routes.follow_path(conn, :create), follow: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.follow_path(conn, :show, id))

      assert %{
               "id" => id,
               "deleted_at" => "2010-04-17T14:00:00"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.follow_path(conn, :create), follow: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update follow" do
    setup [:create_follow]

    test "renders follow when data is valid", %{conn: conn, follow: %Follow{id: id} = follow} do
      conn = put(conn, Routes.follow_path(conn, :update, follow), follow: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.follow_path(conn, :show, id))

      assert %{
               "id" => id,
               "deleted_at" => "2011-05-18T15:01:01"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, follow: follow} do
      conn = put(conn, Routes.follow_path(conn, :update, follow), follow: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete follow" do
    setup [:create_follow]

    test "deletes chosen follow", %{conn: conn, follow: follow} do
      conn = delete(conn, Routes.follow_path(conn, :delete, follow))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.follow_path(conn, :show, follow))
      end
    end
  end

  defp create_follow(_) do
    follow = fixture(:follow)
    %{follow: follow}
  end
end
