defmodule SamacareWeb.FollowView do
  use SamacareWeb, :view
  alias SamacareWeb.FollowView

  def render("index.json", %{follows: follows}) do
    %{data: render_many(follows, FollowView, "follow.json")}
  end

  def render("show.json", %{follow: follow}) do
    %{data: render_one(follow, FollowView, "follow.json")}
  end

  def render("follow.json", %{follow: follow}) do
    %{id: follow.id,
      deleted_at: follow.deleted_at}
  end
end
