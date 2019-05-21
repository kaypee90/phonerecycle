defmodule PhoneRecycle.Router do
  use PhoneRecycle.Web, :router

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

  scope "/api/v1", PhoneRecycle do
    pipe_through :api

    get "/phones", PhoneController, :index
    get "/phones/:id", PhoneController, :show
    post "/phones", PhoneController, :create
    put "/phones/:id", PhoneController, :update
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoneRecycle do
  #   pipe_through :api
  # end
end
