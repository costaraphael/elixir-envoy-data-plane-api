defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.AuthType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :BASIC_AUTH, 0
  field :URL_ENCODED_BODY, 1
end

defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.ClientCredentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :client_id, 1, type: :string, json_name: "clientId", deprecated: false

  field :client_secret, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "clientSecret",
    deprecated: false

  field :auth_type, 3,
    type: Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.AuthType,
    json_name: "authType",
    enum: true
end

defmodule Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2 do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :flow_type, 0

  field :token_endpoint, 1,
    type: Envoy.Config.Core.V3.HttpUri,
    json_name: "tokenEndpoint",
    deprecated: false

  field :scopes, 2, repeated: true, type: :string

  field :client_credentials, 3,
    type: Envoy.Extensions.Http.InjectedCredentials.Oauth2.V3.OAuth2.ClientCredentials,
    json_name: "clientCredentials",
    oneof: 0

  field :token_fetch_retry_interval, 4,
    type: Google.Protobuf.Duration,
    json_name: "tokenFetchRetryInterval",
    deprecated: false
end