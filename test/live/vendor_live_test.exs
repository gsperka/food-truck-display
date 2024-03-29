defmodule FoodTruckWeb.VendorLiveTest do
  use ExUnit.Case
  use FoodTruckWeb.ConnCase
  import FoodTruck.Factory
  import Phoenix.ConnTest

  test "show vendor details with valid id", %{conn: conn} do
    vendor = insert(:vendor)
    conn = get(conn, "/vendor/#{vendor.id}")
    assert html_response(conn, 200) =~ "#{vendor.applicant}"
  end

  test "show error message with invalid id", %{conn: conn} do
    vendor = insert(:vendor)
    conn = get(conn, "/vendor/#{vendor.id}1234")
    assert html_response(conn, 200) =~ "There is no vendor with that ID"
  end
end
