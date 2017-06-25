defmodule ElmContacts.Repo.Migrations.CreateGinIndexForContacts do
  use Ecto.Migration

  def change do
    execute """
      CREATE INDEX conctacts_full_text_index
      ON contacts
      USING gin (
        to_tsvector(
          'english',
          first_name || ' ' ||
          last_name || ' ' ||
          location || ' ' ||
          headline || ' ' ||
          email || ' ' ||
          phone_number
        )
      );
    """
  end
end
