defmodule Auction.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :title, :string
    field :description, :string
    field :ends_at, :utc_datetime
    timestamps()
  end



  def changeset(item, params \\ %{}) do
    item
    |> cast(params, [:title, :description, :ends_at])
    |> validate_required(:title)
    |> validate_length(:title, min: 3, max: 50)
    |> validate_length(:description, max: 200)
    |> validate_change(:ends_at, fn :ends_at, date -> validate(:ends_at, date) end )
  end



  defp validate(:ends_at, ends_at_date) do # You don’t want to expose it to external modules

    case DateTime.compare(ends_at_date, DateTime.utc_now()) do

      :lt -> [ends_at: "ends_at cannot be in the past"]
      _ -> []

    end

  end

end
