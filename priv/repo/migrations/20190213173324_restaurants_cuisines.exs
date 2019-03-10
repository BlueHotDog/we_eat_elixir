defmodule WeEat.Repo.Migrations.RestaurantsCuisines do
  use Ecto.Migration

  def change do
    create table(:restaurants_cuisines) do
      add :restaurant_id, references(:restaurants)
      add :cuisine_id, references(:cuisines)
    end

    create unique_index(:restaurants_cuisines, [:restaurant_id, :cuisine_id])
  end
end
