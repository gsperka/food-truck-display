defmodule FoodTruck.Vendor do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias FoodTruck.Repo

  schema "vendor" do
    field :objectid, :string
    field :applicant, :string
    field :locationdescription, :string
    field :address, :string
    field :schedule, :string
    field :latitude, :string
    field :longitude, :string
    field :blocklot, :string
    field :permit, :string
    field :status, :string
    field :facilitytype, :string
    field :lot, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:objectid, :applicant, :locationdescription, :address, :schedule, :latitude, :longitude, :blocklot, :permit, :status, :facilitytype, :lot])
    |> validate_required([:objectid, :applicant, :locationdescription, :address, :schedule, :latitude, :longitude, :blocklot, :permit, :status, :facilitytype, :lot])
  end

  def sort_vendors_by_applicant(_params \\ %{}) do
    from(
      v in FoodTruck.Vendor,
      order_by: :applicant
    )
    |> Repo.all()
  end
end
