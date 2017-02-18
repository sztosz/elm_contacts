defmodule ElmContacts.ContactView do
  use ElmContacts.Web, :view

  def render("index.json", %{page: page}), do: page
end
