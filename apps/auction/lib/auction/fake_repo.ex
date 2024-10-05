defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "My first item",
      description: "It's really my first item",
      ends_at: ~N[2024-10-20 14:00:00]
    },
    %Item{
      id: 2,
      title: "WarGames Bluray",
      description: "The best computer movie of all time, now on Bluray!",
      ends_at: ~N[2018-10-15 13:39:35]
    },
    %Item{
      id: 3,
      title: "U2 - Achtung Baby on CD",
      description: "The sound of 4 men chopping down The Joshua Tree",
      ends_at: ~N[2018-11-05 03:12:29]
    },
    %Item{
      id: 4,
      title: "Camiseta Ronaldinho",
      description: "La 10 del astro que usó en la final del mundial 2002",
      ends_at: ~N[2018-11-05 03:12:29]
    }
  ]

  def all(Item) do
    @items
  end

  def get!(Item, id) do
    # Enum.find(@items, fn item -> item.id === id end)
    @items |> Enum.find(&(&1.id === id))
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn item ->

      Enum.all?(Map.keys(attrs), fn key ->

        Map.get(item, key) === attrs[key]

      end)

    end)
  end

end
