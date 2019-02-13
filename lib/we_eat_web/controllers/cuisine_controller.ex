defmodule WeEatWeb.CuisineController do
  use WeEatWeb, :controller

  alias WeEat.Cuisines
  alias WeEat.Cuisines.Cuisine

  def index(conn, _params) do
    cuisines = Cuisines.list_cuisines()
    render(conn, "index.html", cuisines: cuisines)
  end

  def new(conn, _params) do
    changeset = Cuisines.change_cuisine(%Cuisine{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cuisine" => cuisine_params}) do
    case Cuisines.create_cuisine(cuisine_params) do
      {:ok, cuisine} ->
        conn
        |> put_flash(:info, "Cuisine created successfully.")
        |> redirect(to: Routes.cuisine_path(conn, :show, cuisine))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cuisine = Cuisines.get_cuisine!(id)
    render(conn, "show.html", cuisine: cuisine)
  end

  def edit(conn, %{"id" => id}) do
    cuisine = Cuisines.get_cuisine!(id)
    changeset = Cuisines.change_cuisine(cuisine)
    render(conn, "edit.html", cuisine: cuisine, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cuisine" => cuisine_params}) do
    cuisine = Cuisines.get_cuisine!(id)

    case Cuisines.update_cuisine(cuisine, cuisine_params) do
      {:ok, cuisine} ->
        conn
        |> put_flash(:info, "Cuisine updated successfully.")
        |> redirect(to: Routes.cuisine_path(conn, :show, cuisine))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cuisine: cuisine, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cuisine = Cuisines.get_cuisine!(id)
    {:ok, _cuisine} = Cuisines.delete_cuisine(cuisine)

    conn
    |> put_flash(:info, "Cuisine deleted successfully.")
    |> redirect(to: Routes.cuisine_path(conn, :index))
  end
end
