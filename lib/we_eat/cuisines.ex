defmodule WeEat.Cuisines do
  @moduledoc """
  The Cuisines context.
  """

  import Ecto.Query, warn: false
  alias WeEat.Repo

  alias WeEat.Cuisines.Cuisine

  @doc """
  Returns the list of cuisines.

  ## Examples

      iex> list_cuisines()
      [%Cuisine{}, ...]

  """
  def list_cuisines do
    Repo.all(Cuisine)
  end

  @doc """
  Gets a single cuisine.

  Raises `Ecto.NoResultsError` if the Cuisine does not exist.

  ## Examples

      iex> get_cuisine!(123)
      %Cuisine{}

      iex> get_cuisine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cuisine!(id), do: Repo.get!(Cuisine, id)

  def get_cuisines(ids) when is_list(ids) do
    Cuisine |> where([cuisine], cuisine.id in ^ids) |> Repo.all()
  end

  @doc """
  Creates a cuisine.

  ## Examples

      iex> create_cuisine(%{field: value})
      {:ok, %Cuisine{}}

      iex> create_cuisine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cuisine(attrs \\ %{}) do
    %Cuisine{}
    |> Cuisine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cuisine.

  ## Examples

      iex> update_cuisine(cuisine, %{field: new_value})
      {:ok, %Cuisine{}}

      iex> update_cuisine(cuisine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cuisine(%Cuisine{} = cuisine, attrs) do
    cuisine
    |> Cuisine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cuisine.

  ## Examples

      iex> delete_cuisine(cuisine)
      {:ok, %Cuisine{}}

      iex> delete_cuisine(cuisine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cuisine(%Cuisine{} = cuisine) do
    Repo.delete(cuisine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cuisine changes.

  ## Examples

      iex> change_cuisine(cuisine)
      %Ecto.Changeset{source: %Cuisine{}}

  """
  def change_cuisine(%Cuisine{} = cuisine) do
    Cuisine.changeset(cuisine, %{})
  end
end
