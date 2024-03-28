defmodule FoodTruck.Repo.Migrations.CreateVendor do
  use Ecto.Migration

  def change do
    create table(:vendor) do
      add :applicant, :string
      add :objectid, :string
      add :locationdescription, :string
      add :address, :string
      add :schedule, :string
      add :latitude, :string
      add :longitude, :string

      timestamps(type: :utc_datetime)
    end
  end
end
