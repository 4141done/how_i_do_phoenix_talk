defmodule GetTogather.MeetupsTest do
  use ExUnit.Case

  alias GetTogather.Meetups

  describe "groups" do
    alias GetTogather.Meetups.Group

    test "list_groups/0 returns the most recently updated three groups by default" do
      expected = ["Seattle Elixir Meetup", "Portland Elixir Meetup", "East Olympia Snake Painters"]

      assert ^expected = Meetups.list_groups() |> Enum.map(&Map.get(&1, :name))
    end

    test "get_group/1 returns the group with the correct_id" do
      expected = %Group{
        name: "Seattle Elixir Meetup",
        id: 1,
        inserted_at: ~N[2018-01-06 23:00:04],
        updated_at: ~N[2018-01-06 23:00:04]
      }

      assert expected == Meetups.get_group(1)
    end
  end
end
