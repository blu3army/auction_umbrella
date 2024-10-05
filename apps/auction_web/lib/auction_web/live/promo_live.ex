defmodule AuctionWeb.PromoLive do
  use AuctionWeb, :live_view
  alias Auction.Promo.Recipient
  alias Auction.Promo

  def mount(_params, _session, socket) do
    {:ok,
      socket
      |> assign_recipient()
      |> assign_changeset()
    }
  end

  def assign_recipient(socket) do
    socket
    |> assign(:recipient, %Recipient{})
  end

  def assign_changeset( %{ assigns: %{recipient: recipient} } = socket ) do
    socket
    |> assign(:changeset, Promo.change_recipient(recipient))
  end


  attr :text, :string, required: true

  def title(assigns) do
    ~H"""
      <h1 class="text-4xl text-teal-700 mb-10">
        <%= @text %>
      </h1>
    """
  end


  def my_form(assigns) do
    ~H"""
      <form></form>
    """
  end


end
