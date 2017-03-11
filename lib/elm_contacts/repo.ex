defmodule ElmContacts.Repo do
  use Ecto.Repo, otp_app: :elm_contacts
  use Scrivener, page_size: 9
end
