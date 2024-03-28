defmodule FoodTruck.Seed do
  use Ecto.Schema

  require Logger
  
  alias FoodTruck.Vendor

  @url "https://data.sfgov.org/resource/rqzj-sfat.json"

  def populate() do
    case HTTPoison.get(@url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> parse_data()

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        Logger.error("Vendor data not found")
      {:error, %HTTPoison.Error{reason: reason}} ->
        Logger.error("Error retrieving vendor data: #{reason}")
    end
  end

  defp parse_data(body) do
    body
    |> Enum.map(fn (vendor_data) -> 
      changeset = Vendor.changeset(%Vendor{}, vendor_data)

      if changeset.valid? do
        vendor = FoodTruck.Repo.insert!(changeset)
        Logger.info("Vendor created with an id of #{vendor.id}") 
      else
        Logger.error("Error retrieving vendor data: #{inspect(changeset.errors)}") 
      end 
    end)
  end
end