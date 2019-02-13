defmodule WeEat.Restaurants.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  alias WeEat.Cuisines.Cuisine

  schema "restaurants" do
    field :location, :string
    field :name, :string
    field :rating, :integer

    many_to_many :cuisines, Cuisine, join_through: "restaurains_cuisines"

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:name, :location, :rating])
    |> validate_required([:name, :location, :rating])
  end
end
