defmodule Envoy.Extensions.Http.StatefulSession.Cookie.V3.CookieBasedSessionState do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cookie, 1, type: Envoy.Type.Http.V3.Cookie, deprecated: false
end