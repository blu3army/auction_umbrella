defmodule Auction.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Auction.Repo,
      {DNSCluster, query: Application.get_env(:auction, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Auction.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Auction.Finch}
      # Start a worker by calling: Auction.Worker.start_link(arg)
      # {Auction.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Auction.Supervisor)
  end
end
