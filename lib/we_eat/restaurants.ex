defmodule WeEat.Restaurants do
  @moduledoc """
  The Restaurants context.
  """

  import Ecto.Query, warn: false
  alias WeEat.Repo

  alias WeEat.Restaurants.Restaurant

  def add_cuisines(%Restaurant{} = restaurant, cuisines_ids) when is_list(cuisines_ids) do
    cuisines = WeEat.Cuisines.get_cuisines(cuisines_ids)

    Repo.preload(restaurant, [:cuisines])

    restaurant
    |> Repo.preload([:cuisines])
    |> Restaurant.changeset_update_cousines(cuisines)
    |> Repo.update()
  end

  @doc """
  Returns the list of restaurants.

  ## Examples

      iex> list_restaurants()
      [%Restaurant{}, ...]

  """
  def list_restaurants do
    Repo.all(Restaurant)
  end

  @doc """
  Gets a single restaurant.

  Raises `Ecto.NoResultsError` if the Restaurant does not exist.

  ## Examples

      iex> get_restaurant!(123)
      %Restaurant{}

      iex> get_restaurant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_restaurant!(id), do: Repo.get!(Restaurant, id)

  @doc """
  Creates a restaurant.

  ## Examples

      iex> create_restaurant(%{field: value})
      {:ok, %Restaurant{}}

      iex> create_restaurant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_restaurant(attrs \\ %{}) do
    %Restaurant{}
    |> Restaurant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a restaurant.

  ## Examples

      iex> update_restaurant(restaurant, %{field: new_value})
      {:ok, %Restaurant{}}

      iex> update_restaurant(restaurant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_restaurant(%Restaurant{} = restaurant, attrs) do
    restaurant
    |> Restaurant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Restaurant.

  ## Examples

      iex> delete_restaurant(restaurant)
      {:ok, %Restaurant{}}

      iex> delete_restaurant(restaurant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_restaurant(%Restaurant{} = restaurant) do
    Repo.delete(restaurant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking restaurant changes.

  ## Examples

      iex> change_restaurant(restaurant)
      %Ecto.Changeset{source: %Restaurant{}}

  """
  def change_restaurant(%Restaurant{} = restaurant) do
    Restaurant.changeset(restaurant, %{})
  end
end
