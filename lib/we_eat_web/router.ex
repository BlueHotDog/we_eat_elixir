defmodule WeEatWeb.Router do
  use WeEatWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WeEatWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/cuisines", CuisineController
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeEatWeb do
  #   pipe_through :api
  # end
end
