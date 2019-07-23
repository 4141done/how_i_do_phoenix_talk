defmodule GetTogatherWeb.GroupView do
  use GetTogatherWeb, :view

  def render("index.json", %{groups: groups}) do
    %{
      groups: render_many(groups, __MODULE__, "group.json", as: :group)
    }
  end

  def render("show.json", %{group: group}) do
    render_one(group, __MODULE__, "group.json", as: :group)
  end

  # The key in the second argument is normally inferred from the view name
  def render("group.json", %{group: group}) do
    %{
      name: group.name,
      id: group.id
    }
  end
end