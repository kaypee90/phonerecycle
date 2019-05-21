defmodule PhoneRecycle.PhoneController do
  use PhoneRecycle.Web, :controller

  def index(conn, _params) do
    phones = Repo.all(PhoneRecycle.Phone)
    json conn_with_status(conn, phones), phones
  end

  def show(conn, %{"id" => id}) do
    phone = Repo.get(PhoneRecycle.Phone, String.to_integer(id))
    json conn_with_status(conn, phone), phone
  end

  def create(conn, params) do
    changeset = PhoneRecycle.Phone.changeset(
    %PhoneRecycle.Phone{}, params)
    case Repo.insert(changeset) do
      {:ok, phone} ->
        json conn |> put_status(:created), phone
      {:error, _changeset} ->
        json conn |> put_status(:bad_request), %{errors: ["unable to create phone recycle information"] }
    end
  end

  def update(conn, %{"id" => id} = params) do
    phone = Repo.get(PhoneRecycle.Phone, id)
    if phone do
      perform_update(conn, phone, params)
    else
      json conn |> put_status(:not_found),
                   %{errors: ["invalid phone recycle information"]}
    end
  end

  defp perform_update(conn, phone, params) do
    changeset = PhoneRecycle.Phone.changeset(phone, params)
    case Repo.update(changeset) do
      {:ok, phone} ->
        json conn |> put_status(:ok), phone
      {:error, _result} ->
        json conn |> put_status(:bad_request),
                     %{errors: ["unable to update user"]}
    end
  end

  defp conn_with_status(conn, nil) do
    conn
      |> put_status(:not_found)
  end
  defp conn_with_status(conn, _) do
    conn
      |> put_status(:ok)
  end
end
