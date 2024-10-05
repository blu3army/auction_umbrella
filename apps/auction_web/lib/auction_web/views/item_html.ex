defmodule AuctionWeb.ItemHTML do
  use AuctionWeb, :html

  attr :text, :string, required: true

  def big_title(assigns) do
    ~H"""
      <h1 class="text-6xl">
        <%= @text %>
      </h1>
    """
  end


  attr :text, :string, default: "Subtítulo"
  attr :rest, :global, default: %{class: "text-blue-500 text-3xl font-semibold"}

  def subtitle(assigns) do
    ~H"""
      <h2 {@rest} ><%= @text %></h2>
    """
  end


  attr :item, :map, default: %{id: 0, title: "Unknown", description: "Nada para mostrar"}

  def simple_li(assigns) do
    ~H"""
      <li class="my-5">
          <h3 class="text-2xl">
              <.link href={~p"/items/#{@item.id}"}>
                  <b><%= @item.title %></b>
              </.link>
          </h3>
          <p>
              <%= @item.description %>
          </p>
      </li>
    """
  end


  slot :inner_block, required: true

  def my_button(assigns) do
    ~H"""
      <button>
        <%= render_slot(@inner_block) %>
      </button>
    """
  end


  slot :inner_block, required: true
  attr :entries, :list, default: []

  def my_list(assigns) do
    ~H"""
    <ul>
      <%= for entry <- @entries do %>

        <li>
          <%= render_slot(@inner_block, entry) %>
        </li>

      <% end %>
    </ul>
    """
  end


  slot :header
  slot :inner_block, required: true
  slot :footer, required: true

  attr :general_class, :string
  attr :class, :string, default: "text-stone-600"

  def my_modal(assigns) do
    ~H"""
      <div class={@general_class}>
        <div>
          <%= render_slot(@header) || "Unknown title" %>
        </div>
        <div>
          <%= render_slot(@inner_block) %>
        </div>
        <div class={@class}>
          <%= render_slot(@footer) %>
        </div>
      </div>
    """
  end


  embed_templates "../templates/item_html/*"
end
