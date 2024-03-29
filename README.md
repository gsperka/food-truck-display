# Food Truck Viewer  

## To View Staging

Visit https://food-truck-display.onrender.com/

This is a free service hosted on [Render](https://render.com/) and it will take roughly 30 seconds to load.

## Clone Repo

This app was created on an M3 Macbook Air using Sonoma 14.4. It was an implementation of the [Peck assignment](https://github.com/peck/engineering-assessment).

### Overview
 
The homepage displays all the local food trucks after seeding the database. Once you click "view", you can see the individual show page for that data point. The Google Maps API was used to drop a marker on the exact location on where the food truck will be. 

### Future improvement ideas
- Make mobile responsive
- Add a search functionality on the homepage
- Upgrade the overall look and feel
- Sorting of table columns on homepage


### Getting Started
```
cd ~/Desktop 
git clone https://github.com/gsperka/food-truck-display.git
cd food-truck-display
```

Postgres will need to be installed:

```
brew install postgresql@14
brew services start postgresql@14
```

Once inside the repo, you will need to create a local database: 

```
createdb food_truck_dev
```

Run dependencies: 

```
mix deps.get
```

Seed database: 

```
mix run priv/repo/seeds.exs
```

Run Tests: 

```
mix test
```

This app uses the Google API. You will need your own key and set it as an environment variable

In you `/.env` file, 

```
export GOOGLE_CLIENT_SECRET="YOUR SECRET"
```

You can also run this same command in your terminal shell.


Start your Phoenix server:

```
mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
