defmodule ElmContacts.PageController do
  use ElmContacts.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
