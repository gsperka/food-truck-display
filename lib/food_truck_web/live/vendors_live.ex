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
          <.th></.th>
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
              <.icon name={get_icon(vendor.facilitytype)} class="h-10 mx-auto text-gray-700 dark:text-gray-300"/> <p class="text-center"><%= vendor.facilitytype %></p>
            </.td>
            <.td>
              <.badge color={get_badge_color(vendor.status)} label={vendor.status} />
            </.td>
            <.td>
              <.a to={"/vendor/#{vendor.objectid}"} label="View" class="text-primary-600 dark:text-primary-400" />
            </.td>
          </.tr>
        <% end %>
      </.table>
    </div>
    """
  end

  defp get_badge_color(status) do
    case status do
      "APPROVED" -> "success"
      "EXPIRED" -> "danger"
      "REQUESTED" -> "warning"
      _ -> "info"
    end
  end

  defp get_icon(type) do
    case type do
      "Push Cart" -> :shopping_cart
      "Truck" -> :truck
      _ -> :shopping_cart
    end
  end
end
