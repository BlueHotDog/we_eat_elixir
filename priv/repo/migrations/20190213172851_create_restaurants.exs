defmodule WeEat.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :name, :string
      add :location, :string
      add :rating, :integer

      timestamps()
    end

  end
end
