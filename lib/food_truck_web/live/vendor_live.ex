defmodule FoodTruckWeb.VendorLive do
  use FoodTruckWeb, :live_view
  alias FoodTruck.Vendor
  # alias FoodTruck.Repo

  @spec mount(any(), any(), Phoenix.LiveView.Socket.t()) :: {:ok, Phoenix.LiveView.Socket.t()}
  def mount( %{"id" => id} = _params, _session, socket) do
    with {:ok, result} <- Vendor.get_by_id((id)) do
      socket = assign(socket, vendor: result)
       {:ok, socket}
    else
      {:error, :not_found} ->
        socket = assign(socket, vendor: nil)
        {:ok, socket}
    end
  end

  def render(assigns) do
    ~H"""
      <div>
        <%= if @vendor do %>
          <%= @vendor.id %>
        <% else %>
          <h1>There is no vendor with that ID</h1>
        <% end %>
      </div>
    """
  end
end
