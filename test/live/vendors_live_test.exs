defmodule FoodTruckWeb.VendorsLiveTest do
  use ExUnit.Case
  use FoodTruckWeb.ConnCase
  import Phoenix.ConnTest
  import Phoenix.LiveViewTest

  test "disconnected and connected mount", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Applicant"
  end
end
