defmodule Auction do
  alias Auction.{Repo, Item}

  # @repo FakeRepo # Para cuando cambiemos el repo, para no tener que cambiar en c/ fn
  @repo Repo

  # When you pass Item in as the first argument, it lets the
  # repo know which database table (set of data) you’re requesting
  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end


  def insert_item(attrs) do
    Item
    |> struct(attrs)
    |> @repo.insert()
  end

  def delete_item(%Item{} = item) do
    @repo.delete(item)
  end

  def update(%Item{} = item, updates) do

    item
    |> Item.changeset(updates)
    |> @repo.update()

  end

  def new_item, do: Item.changeset(%Item{})

end
