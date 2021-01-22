defmodule SamacareWeb.TestGreenController do
  use SamacareWeb, :controller

  alias Samacare.TestColors
  alias Samacare.TestColors.TestGreen

  action_fallback SamacareWeb.FallbackController

  def index(conn, _params) do
    test_greens = TestColors.list_test_greens()
    render(conn, "index.json", test_greens: test_greens)
  end

  def create(conn, %{"test_green" => test_green_params}) do
    with {:ok, %TestGreen{} = test_green} <- TestColors.create_test_green(test_green_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.test_green_path(conn, :show, test_green))
      |> render("show.json", test_green: test_green)
    end
  end

  def show(conn, %{"id" => id}) do
    test_green = TestColors.get_test_green!(id)
    render(conn, "show.json", test_green: test_green)
  end

  def update(conn, %{"id" => id, "test_green" => test_green_params}) do
    test_green = TestColors.get_test_green!(id)

    with {:ok, %TestGreen{} = test_green} <- TestColors.update_test_green(test_green, test_green_params) do
      render(conn, "show.json", test_green: test_green)
    end
  end

  def delete(conn, %{"id" => id}) do
    test_green = TestColors.get_test_green!(id)

    with {:ok, %TestGreen{}} <- TestColors.delete_test_green(test_green) do
      send_resp(conn, :no_content, "")
    end
  end
end
