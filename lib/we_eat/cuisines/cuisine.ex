defmodule WeEat.Cuisines.Cuisine do
  use Ecto.Schema
  import Ecto.Changeset

  alias WeEat.Restaurants.Restaurant

  schema "cuisines" do
    field :name, :string
    many_to_many :restaurants, Restaurant, join_through: "restaurants_cuisines"
    timestamps()
  end

  @doc false
  def changeset(cuisine, attrs) do
    cuisine
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
