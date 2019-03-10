defmodule WeEat.Restaurants.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias WeEat.Cuisines.Cuisine

  schema "restaurants" do
    field :location, :string
    field :name, :string
    field :rating, :integer

    many_to_many :cuisines, Cuisine, join_through: "restaurants_cuisines", on_replace: :update

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:name, :location, :rating])
    |> validate_required([:name, :location, :rating])
  end

  @doc false
  def changeset_update_cousines(restaurant, cuisines) do
    restaurant
    |> cast(%{}, [])
    |> put_assoc(:cuisines, cuisines)
  end
end
