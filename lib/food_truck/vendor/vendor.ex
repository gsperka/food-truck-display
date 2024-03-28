defmodule FoodTruck.Vendor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vendor" do
    field :objectid, :string
    field :applicant, :string
    field :locationdescription, :string
    field :address, :string
    field :schedule, :string
    field :latitude, :string
    field :longitude, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:objectid, :applicant, :locationdescription, :address, :schedule, :latitude, :longitude])
    |> validate_required([:objectid, :applicant, :locationdescription, :address, :schedule, :latitude, :longitude])
  end
end
