defmodule WeEatWeb.RestaurantController do
  use WeEatWeb, :controller

  alias WeEat.Restaurants
  alias WeEat.Restaurants.Restaurant

  def index(conn, _params) do
    restaurants = Restaurants.list_restaurants()
    render(conn, "index.html", restaurants: restaurants)
  end

  def new(conn, _params) do
    changeset = Restaurants.change_restaurant(%Restaurant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"restaurant" => restaurant_params}) do
    case Restaurants.create_restaurant(restaurant_params) do
      {:ok, restaurant} ->
        conn
        |> put_flash(:info, "Restaurant created successfully.")
        |> redirect(to: Routes.restaurant_path(conn, :show, restaurant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    restaurant = Restaurants.get_restaurant!(id)
    render(conn, "show.html", restaurant: restaurant)
  end

  def edit(conn, %{"id" => id}) do
    restaurant = Restaurants.get_restaurant!(id)
    changeset = Restaurants.change_restaurant(restaurant)
    render(conn, "edit.html", restaurant: restaurant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "restaurant" => restaurant_params}) do
    restaurant = Restaurants.get_restaurant!(id)

    case Restaurants.update_restaurant(restaurant, restaurant_params) do
      {:ok, restaurant} ->
        conn
        |> put_flash(:info, "Restaurant updated successfully.")
        |> redirect(to: Routes.restaurant_path(conn, :show, restaurant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", restaurant: restaurant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    restaurant = Restaurants.get_restaurant!(id)
    {:ok, _restaurant} = Restaurants.delete_restaurant(restaurant)

    conn
    |> put_flash(:info, "Restaurant deleted successfully.")
    |> redirect(to: Routes.restaurant_path(conn, :index))
  end
end
