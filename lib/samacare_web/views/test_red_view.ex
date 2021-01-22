defmodule SamacareWeb.TestRedView do
  use SamacareWeb, :view
  alias SamacareWeb.TestRedView

  def render("index.json", %{test_reds: test_reds}) do
    %{data: render_many(test_reds, TestRedView, "test_red.json")}
  end

  def render("show.json", %{test_red: test_red}) do
    %{data: render_one(test_red, TestRedView, "test_red.json")}
  end

  def render("test_red.json", %{test_red: test_red}) do
    %{id: test_red.id,
      name: test_red.name,
      age: test_red.age,
      birthdate: test_red.birthdate,
      active_at: test_red.active_at}
  end
end
