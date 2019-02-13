defmodule WeEat.RestaurantsTest do
  use WeEat.DataCase

  alias WeEat.Restaurants

  describe "restaurants" do
    alias WeEat.Restaurants.Restaurant

    @valid_attrs %{location: "some location", name: "some name", rating: 42}
    @update_attrs %{location: "some updated location", name: "some updated name", rating: 43}
    @invalid_attrs %{location: nil, name: nil, rating: nil}

    def restaurant_fixture(attrs \\ %{}) do
      {:ok, restaurant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Restaurants.create_restaurant()

      restaurant
    end

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      assert Restaurants.list_restaurants() == [restaurant]
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Restaurants.get_restaurant!(restaurant.id) == restaurant
    end

    test "create_restaurant/1 with valid data creates a restaurant" do
      assert {:ok, %Restaurant{} = restaurant} = Restaurants.create_restaurant(@valid_attrs)
      assert restaurant.location == "some location"
      assert restaurant.name == "some name"
      assert restaurant.rating == 42
    end

    test "create_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Restaurants.create_restaurant(@invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{} = restaurant} = Restaurants.update_restaurant(restaurant, @update_attrs)
      assert restaurant.location == "some updated location"
      assert restaurant.name == "some updated name"
      assert restaurant.rating == 43
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Restaurants.update_restaurant(restaurant, @invalid_attrs)
      assert restaurant == Restaurants.get_restaurant!(restaurant.id)
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Restaurants.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Restaurants.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Restaurants.change_restaurant(restaurant)
    end
  end
end
