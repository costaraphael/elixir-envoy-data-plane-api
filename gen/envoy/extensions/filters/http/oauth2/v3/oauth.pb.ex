defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config.AuthType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :URL_ENCODED_BODY, 0
  field :BASIC_AUTH, 1
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Credentials.CookieNames do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :bearer_token, 1, type: :string, json_name: "bearerToken", deprecated: false
  field :oauth_hmac, 2, type: :string, json_name: "oauthHmac", deprecated: false
  field :oauth_expires, 3, type: :string, json_name: "oauthExpires", deprecated: false
  field :id_token, 4, type: :string, json_name: "idToken", deprecated: false
  field :refresh_token, 5, type: :string, json_name: "refreshToken", deprecated: false
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Credentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :token_formation, 0

  field :client_id, 1, type: :string, json_name: "clientId", deprecated: false

  field :token_secret, 2,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "tokenSecret",
    deprecated: false

  field :hmac_secret, 3,
    type: Envoy.Extensions.TransportSockets.Tls.V3.SdsSecretConfig,
    json_name: "hmacSecret",
    oneof: 0,
    deprecated: false

  field :cookie_names, 4,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Credentials.CookieNames,
    json_name: "cookieNames"
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :token_endpoint, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "tokenEndpoint"

  field :authorization_endpoint, 2,
    type: :string,
    json_name: "authorizationEndpoint",
    deprecated: false

  field :credentials, 3,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Credentials,
    deprecated: false

  field :redirect_uri, 4, type: :string, json_name: "redirectUri", deprecated: false

  field :redirect_path_matcher, 5,
    type: Envoy.Type.Matcher.V3.PathMatcher,
    json_name: "redirectPathMatcher",
    deprecated: false

  field :signout_path, 6,
    type: Envoy.Type.Matcher.V3.PathMatcher,
    json_name: "signoutPath",
    deprecated: false

  field :forward_bearer_token, 7, type: :bool, json_name: "forwardBearerToken"

  field :pass_through_matcher, 8,
    repeated: true,
    type: Envoy.Config.Route.V3.HeaderMatcher,
    json_name: "passThroughMatcher"

  field :auth_scopes, 9, repeated: true, type: :string, json_name: "authScopes"
  field :resources, 10, repeated: true, type: :string

  field :auth_type, 11,
    type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config.AuthType,
    json_name: "authType",
    enum: true,
    deprecated: false

  field :use_refresh_token, 12, type: Google.Protobuf.BoolValue, json_name: "useRefreshToken"
  field :default_expires_in, 13, type: Google.Protobuf.Duration, json_name: "defaultExpiresIn"
end

defmodule Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2 do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :config, 1, type: Envoy.Extensions.Filters.Http.Oauth2.V3.OAuth2Config
end