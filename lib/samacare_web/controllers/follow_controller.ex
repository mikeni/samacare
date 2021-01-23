defmodule SamacareWeb.FollowController do
  use SamacareWeb, :controller

  alias Samacare.Posts
  alias Samacare.Posts.Follow

  action_fallback SamacareWeb.FallbackController

  def index(conn, _params) do
    follows = Posts.list_follows()
    render(conn, "index.json", follows: follows)
  end

  def create(conn, %{"follow" => follow_params}) do
    with {:ok, %Follow{} = follow} <- Posts.create_follow(follow_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.follow_path(conn, :show, follow))
      |> render("show.json", follow: follow)
    end
  end

  def show(conn, %{"id" => id}) do
    follow = Posts.get_follow!(id)
    render(conn, "show.json", follow: follow)
  end

  def update(conn, %{"id" => id, "follow" => follow_params}) do
    follow = Posts.get_follow!(id)

    with {:ok, %Follow{} = follow} <- Posts.update_follow(follow, follow_params) do
      render(conn, "show.json", follow: follow)
    end
  end

  def delete(conn, %{"id" => id}) do
    follow = Posts.get_follow!(id)

    with {:ok, %Follow{}} <- Posts.delete_follow(follow) do
      send_resp(conn, :no_content, "")
    end
  end
end
