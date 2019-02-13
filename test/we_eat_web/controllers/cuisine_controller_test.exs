defmodule WeEatWeb.CuisineControllerTest do
  use WeEatWeb.ConnCase

  alias WeEat.Cuisines

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:cuisine) do
    {:ok, cuisine} = Cuisines.create_cuisine(@create_attrs)
    cuisine
  end

  describe "index" do
    test "lists all cuisines", %{conn: conn} do
      conn = get(conn, Routes.cuisine_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cuisines"
    end
  end

  describe "new cuisine" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cuisine_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cuisine"
    end
  end

  describe "create cuisine" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cuisine_path(conn, :create), cuisine: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cuisine_path(conn, :show, id)

      conn = get(conn, Routes.cuisine_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cuisine"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cuisine_path(conn, :create), cuisine: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cuisine"
    end
  end

  describe "edit cuisine" do
    setup [:create_cuisine]

    test "renders form for editing chosen cuisine", %{conn: conn, cuisine: cuisine} do
      conn = get(conn, Routes.cuisine_path(conn, :edit, cuisine))
      assert html_response(conn, 200) =~ "Edit Cuisine"
    end
  end

  describe "update cuisine" do
    setup [:create_cuisine]

    test "redirects when data is valid", %{conn: conn, cuisine: cuisine} do
      conn = put(conn, Routes.cuisine_path(conn, :update, cuisine), cuisine: @update_attrs)
      assert redirected_to(conn) == Routes.cuisine_path(conn, :show, cuisine)

      conn = get(conn, Routes.cuisine_path(conn, :show, cuisine))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, cuisine: cuisine} do
      conn = put(conn, Routes.cuisine_path(conn, :update, cuisine), cuisine: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cuisine"
    end
  end

  describe "delete cuisine" do
    setup [:create_cuisine]

    test "deletes chosen cuisine", %{conn: conn, cuisine: cuisine} do
      conn = delete(conn, Routes.cuisine_path(conn, :delete, cuisine))
      assert redirected_to(conn) == Routes.cuisine_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.cuisine_path(conn, :show, cuisine))
      end
    end
  end

  defp create_cuisine(_) do
    cuisine = fixture(:cuisine)
    {:ok, cuisine: cuisine}
  end
end
