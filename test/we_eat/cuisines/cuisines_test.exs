defmodule WeEat.CuisinesTest do
  use WeEat.DataCase

  alias WeEat.Cuisines

  describe "cuisines" do
    alias WeEat.Cuisines.Cuisine

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def cuisine_fixture(attrs \\ %{}) do
      {:ok, cuisine} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cuisines.create_cuisine()

      cuisine
    end

    test "list_cuisines/0 returns all cuisines" do
      cuisine = cuisine_fixture()
      assert Cuisines.list_cuisines() == [cuisine]
    end

    test "get_cuisine!/1 returns the cuisine with given id" do
      cuisine = cuisine_fixture()
      assert Cuisines.get_cuisine!(cuisine.id) == cuisine
    end

    test "create_cuisine/1 with valid data creates a cuisine" do
      assert {:ok, %Cuisine{} = cuisine} = Cuisines.create_cuisine(@valid_attrs)
      assert cuisine.name == "some name"
    end

    test "create_cuisine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cuisines.create_cuisine(@invalid_attrs)
    end

    test "update_cuisine/2 with valid data updates the cuisine" do
      cuisine = cuisine_fixture()
      assert {:ok, %Cuisine{} = cuisine} = Cuisines.update_cuisine(cuisine, @update_attrs)
      assert cuisine.name == "some updated name"
    end

    test "update_cuisine/2 with invalid data returns error changeset" do
      cuisine = cuisine_fixture()
      assert {:error, %Ecto.Changeset{}} = Cuisines.update_cuisine(cuisine, @invalid_attrs)
      assert cuisine == Cuisines.get_cuisine!(cuisine.id)
    end

    test "delete_cuisine/1 deletes the cuisine" do
      cuisine = cuisine_fixture()
      assert {:ok, %Cuisine{}} = Cuisines.delete_cuisine(cuisine)
      assert_raise Ecto.NoResultsError, fn -> Cuisines.get_cuisine!(cuisine.id) end
    end

    test "change_cuisine/1 returns a cuisine changeset" do
      cuisine = cuisine_fixture()
      assert %Ecto.Changeset{} = Cuisines.change_cuisine(cuisine)
    end
  end
end
