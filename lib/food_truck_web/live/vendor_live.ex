defmodule FoodTruckWeb.VendorLive do
  use FoodTruckWeb, :live_view
  # alias FoodTruck.Vendor

  @spec mount(any(), any(), Phoenix.LiveView.Socket.t()) :: {:ok, Phoenix.LiveView.Socket.t()}
  def mount(_params, _session, socket) do
    IO.inspect("hi")
    # # this is needed so the database is only queried once on page load
    # if connected?(socket) do
    #   socket = assign(socket, vendors: Vendor.sort_vendors_by_applicant())
    #   {:ok, socket}
    # else
    #   socket = assign(socket, vendors: [])
    #   {:ok, socket}
    # end
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <h1>Hi</h1>
    """
  end
end
