defmodule Auction.Promo do
  alias Auction.Promo.Recipient

  def change_recipient(%Recipient{} = recipient, attrs \\ %{}) do
    Recipient.changeset(recipient, attrs)
  end

  def send_promo(_recipient, _attrs) do
    {:ok, %Recipient{}}
  end

end
