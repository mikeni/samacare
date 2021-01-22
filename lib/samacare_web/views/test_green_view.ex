defmodule SamacareWeb.TestGreenView do
  use SamacareWeb, :view
  alias SamacareWeb.TestGreenView

  def render("index.json", %{test_greens: test_greens}) do
    %{data: render_many(test_greens, TestGreenView, "test_green.json")}
  end

  def render("show.json", %{test_green: test_green}) do
    %{data: render_one(test_green, TestGreenView, "test_green.json")}
  end

  def render("test_green.json", %{test_green: test_green}) do
    %{id: test_green.id,
      name: test_green.name,
      count: test_green.count}
  end
end
