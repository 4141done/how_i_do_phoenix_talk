defmodule GetTogatherWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :get_togather
  plug Status.InspectionPlug, position: :start

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Status.InspectionPlug, position: :after_request_id

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Status.InspectionPlug, position: :after_parsers

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_get_togather_key",
    signing_salt: "X4aLg1Ma"

  plug GetTogatherWeb.Router
end
