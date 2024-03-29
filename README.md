# Food Truck Viewer  

## Clone Repo

This app was created on an M3 Macbook Air using Sonoma 14.4.

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
