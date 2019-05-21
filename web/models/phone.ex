# /models/phone.ex
defmodule PhoneRecycle.Phone do
  use PhoneRecycle.Web, :model

  schema "phones" do
    field :phone_model, :string
    field :submitter_name, :string
    field :submitter_phone, :string
    field :submitter_email, :string
    field :digital_address, :string
    field :street_address, :string
    field :town_or_city, :string
    field :image_url, :string
    field :date_submitted, :string
    field :status, :string

    timestamps()
  end

  def changeset(model, params \\ :empty) do
    model
      |> cast(params, [:phone_model,
                       :submitter_name,
                       :submitter_phone,
                       :submitter_email,
                       :digital_address,
                       :street_address,
                       :town_or_city,
                       :image_url,
                       :date_submitted,
                       :status])
      |> validate_required([:phone_model, :submitter_name, :submitter_phone])
  end

end
