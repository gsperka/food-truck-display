defmodule FoodTruckWeb.VendorsLive do
  use FoodTruckWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    Hey
    """
  end
end