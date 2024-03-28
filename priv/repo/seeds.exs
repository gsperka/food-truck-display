# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FoodTruck.Repo.insert!(%FoodTruck.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FoodTruck.Seed 
alias FoodTruck.Vendor
require Logger

count = FoodTruck.Repo.aggregate(Vendor, :count, :id)

if count == 0 do 
  Seed.populate()
else 
  Logger.info("Database already seeded") 
end