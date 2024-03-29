defmodule FoodTruckWeb.VendorLive do
  use FoodTruckWeb, :live_view
  alias FoodTruck.Vendor

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
          <div id="map"></div>
          <section class="row" id="map-hook" phx-update="ignore" phx-hook={"MapSightingsHandler"} />
          <h1 class="text-4xl mb-10">Vendor Details:</h1>
          <p class="mb-4"><b class="text-lg">Applicant:</b> <%= @vendor.applicant %></p>
          <p class="mb-4"><b class="text-lg">Location Description:</b> <%= @vendor.locationdescription %></p>
          <p class="mb-4"><b class="text-lg">Address:</b> <%= @vendor.address %></p>
          <p class="mb-4"><b class="text-lg">Block Lot:</b> <%= @vendor.blocklot %></p>
          <p class="mb-4"><b class="text-lg">Lot:</b> <%= @vendor.lot %></p>
          <p class="mb-4"><b class="text-lg">Permit Number:</b> <%= @vendor.permit %></p>
          <p class="mb-4"><b class="text-lg">Facility Type:</b> <%= @vendor.permit %></p>
          <p class="mb-4"><b class="text-lg">Latitude</b> <span id="lat"><%= @vendor.latitude %></span></p>
          <p class="mb-4"><b class="text-lg">Longitude:</b> <span id="lng"><%= @vendor.longitude %></span></p>
          <p class="mb-4"><b class="text-lg">Status:</b> <%= @vendor.status %></p>
          <p class="mb-4"><b class="text-lg">Schedule:</b> <a target="_blank" href={"#{@vendor.schedule}"}> <%= @vendor.schedule %> </a> </p>
          <p class="mb-4 flex items-center"><a href="/" class="flex items-center text-2xl"><.icon name={:chevron_double_left} class="h-10 mx-auto text-gray-700 dark:text-gray-300"/> Back to Food Trucks </a></p>
        <% else %>
          <h1>There is no vendor with that ID</h1>
        <% end %>
      </div>
    """
  end
end
