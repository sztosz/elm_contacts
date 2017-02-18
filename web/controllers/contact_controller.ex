defmodule ElmContacts.ContactController do
  use ElmContacts.Web, :controller

  alias ElmContacts.Contact

  def index(conn, params) do
    page =
      Contact
      |> order_by(:first_name)
      |> Repo.paginate(params)

    render(conn, page: page)
  end
end
