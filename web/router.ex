defmodule ElmContacts.Router do
  use ElmContacts.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ElmContacts do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end
end
