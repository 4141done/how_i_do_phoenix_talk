defmodule GetTogather.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias GetTogather.Meetups.Group

  @initial_state [
    %Group{
      name: "Seattle Elixir Meetup",
      id: 1,
      inserted_at: ~N[2018-01-06 23:00:04],
      updated_at: ~N[2018-01-06 23:00:04]
    },
    %Group{
      name: "Portland Elixir Meetup",
      id: 2,
      inserted_at: ~N[2018-02-06 23:00:04],
      updated_at: ~N[2018-02-06 23:00:04]
    },
    %Group{
      name: "East Olympia Snake Painters",
      id: 3,
      inserted_at: ~N[2018-04-06 23:00:04],
      updated_at: ~N[2018-04-06 23:00:04]
    },
    %Group{
      name: "Tacoma Gut Bucket Enthusiasts United",
      id: 4,
      inserted_at: ~N[2018-06-06 23:00:04],
      updated_at: ~N[2018-06-06 23:00:04]
    },
    %Group{
      name: "Tumwater Turtle Identification Collective",
      id: 5,
      inserted_at: ~N[2018-08-06 23:00:04],
      updated_at: ~N[2018-08-06 23:00:04]
    },
    %Group{
      name: "Seattle Bowler Hat Aficionados",
      id: 6,
      inserted_at: ~N[2018-10-06 23:00:04],
      updated_at: ~N[2018-10-06 23:00:04]
    }
  ]

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      GetTogatherWeb.Endpoint,
      {GetTogather.Storage, %{groups: @initial_state}}
      # Starts a worker by calling: GetTogather.Worker.start_link(arg)
      # {GetTogather.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GetTogather.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GetTogatherWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
