defmodule ElmContacts.ContactsChannel do
  use Phoenix.Channel
  alias ElmContacts.{Contact, Repo}
  import Ecto.Query, only: [order_by: 2]

  require Logger

  def join("contacts", _, socket), do: {:ok, socket}

  def handle_in("contacts:fetch", params, socket) do
    Logger.info("Handling Contacts...")

    search = Map.get(params, "search") || ""

    page =
      Contact
      |> Contact.search(search)
      |> order_by(:first_name)
      |> Repo.paginate(params)

    {:reply, {:ok, page}, socket}
  end

  def handle_in("contacts:" <> contact_id, _, socket) do
    Logger.info("Handling contact...")

    contact =
      Contact
      |> Repo.get(contact_id)

    case contact do
      nil ->
        {:reply, {:error, %{error: "Contact not found"}}, socket}
      _ ->
        {:reply, {:ok, contact}, socket}
    end
  end
end
