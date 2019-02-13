defmodule WeEat.Repo.Migrations.RestaurantsCuisines do
  use Ecto.Migration

  def change do
    create table(:restaurants_cuisines) do
      add :restaurant_id, references(:restaurants)
      add :cuisine_id, references(:cuisines)

      timestamps()
    end
  end
end
