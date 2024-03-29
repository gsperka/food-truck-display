defmodule FoodTruckWeb.VendorsLive do
  use FoodTruckWeb, :live_view
  alias FoodTruck.Vendor

  @spec mount(any(), any(), Phoenix.LiveView.Socket.t()) :: {:ok, Phoenix.LiveView.Socket.t()}
  def mount(_params, _session, socket) do

    # this is needed so the database is only queried once on page load
    if connected?(socket) do
      socket = assign(socket, vendors: Vendor.sort_vendors_by_applicant())
      {:ok, socket}
    else
      socket = assign(socket, vendors: [])
      {:ok, socket}
    end
  end

  def render(assigns) do
    ~H"""
    <div>
      <.table>
        <.tr>
          <.th>Applicant</.th>
          <.th>Address</.th>
          <.th>Description</.th>
          <.th>Facility Type</.th>
          <.th>Status</.th>
        </.tr>

        <%= for vendor <- @vendors do %>
          <.tr>
            <.td>
              <%= vendor.applicant %>
            </.td>
            <.td>
              <%= vendor.address %>
            </.td>
            <.td>
              <%= vendor.locationdescription %>
            </.td>
            <.td>
              <%= if vendor.facilitytype == "Push Cart" do %>
                <.icon name={:shopping_cart} class="h-10 mx-auto text-gray-700 dark:text-gray-300"/> <p class="text-center">Push Cart</p>
              <% end %>

              <%= if vendor.facilitytype == "Truck" do %>
                <.icon name={:truck} class="h-10 mx-auto text-gray-700 dark:text-gray-300"/> <p class="text-center">Truck</p>
              <% end %>
            </.td>
            <.td>
              <%= if vendor.status == "REQUESTED" do %>
                <.badge color="warning" label="REQUESTED" />
              <% end %>

              <%= if vendor.status == "EXPIRED" do %>
                <.badge color="danger" label="EXPIRED" />
              <% end %>

              <%= if vendor.status == "APPROVED" do %>
                <.badge color="success" label="APPROVED" />
              <% end %>
            </.td>
          </.tr>
        <% end %>
      </.table>
    </div>
    """
  end
end
