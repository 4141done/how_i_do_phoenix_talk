defmodule GetTogatherWeb.ErrorView do
  use GetTogatherWeb, :view
  import GetTogatherWeb.ErrorHelpers, only: [translate_ecto_changeset: 1]

  def render("404.json", _assigns) do
    %{message: "Not Found"}
  end

  def render("422.json", %{changeset: changeset}) do
    %{message: translate_ecto_changeset(changeset)}
  end

  def render("500.json", %{message: message}) do
    %{message: message}
  end
  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.json", _assigns) do
  #   %{errors: %{detail: "Internal Server Error"}}
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.json" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
