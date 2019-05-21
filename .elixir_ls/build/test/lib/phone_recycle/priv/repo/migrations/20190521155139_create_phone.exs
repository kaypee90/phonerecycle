defmodule PhoneRecycle.Repo.Migrations.CreatePhone do
  use Ecto.Migration

  def change do
    create table(:phones) do
      add :phone_model, :string
      add :submitter_name, :string
      add :submitter_phone, :string
      add :submitter_email, :string
      add :digital_address, :string
      add :street_address, :string
      add :town_or_city, :string
      add :image_url, :string
      add :date_submitted, :string
      add :status, :string
      timestamps()
    end
  end
end
