defmodule SamacareWeb.TestRedController do
  use SamacareWeb, :controller

  alias Samacare.TestColors
  alias Samacare.TestColors.TestRed

  action_fallback SamacareWeb.FallbackController

  def index(conn, _params) do
    test_reds = TestColors.list_test_reds()
    render(conn, "index.json", test_reds: test_reds)
  end

  def create(conn, %{"test_red" => test_red_params}) do
    with {:ok, %TestRed{} = test_red} <- TestColors.create_test_red(test_red_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.test_red_path(conn, :show, test_red))
      |> render("show.json", test_red: test_red)
    end
  end

  def show(conn, %{"id" => id}) do
    test_red = TestColors.get_test_red!(id)
    render(conn, "show.json", test_red: test_red)
  end

  def update(conn, %{"id" => id, "test_red" => test_red_params}) do
    test_red = TestColors.get_test_red!(id)

    with {:ok, %TestRed{} = test_red} <- TestColors.update_test_red(test_red, test_red_params) do
      render(conn, "show.json", test_red: test_red)
    end
  end

  def delete(conn, %{"id" => id}) do
    test_red = TestColors.get_test_red!(id)

    with {:ok, %TestRed{}} <- TestColors.delete_test_red(test_red) do
      send_resp(conn, :no_content, "")
    end
  end
end
