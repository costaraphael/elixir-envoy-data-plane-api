defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :jwks_source_specifier, 0

  field :issuer, 1, type: :string, deprecated: false
  field :audiences, 2, repeated: true, type: :string

  field :remote_jwks, 3,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RemoteJwks,
    json_name: "remoteJwks",
    oneof: 0

  field :local_jwks, 4, type: Envoy.Api.V2.Core.DataSource, json_name: "localJwks", oneof: 0
  field :forward, 5, type: :bool

  field :from_headers, 6,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader,
    json_name: "fromHeaders"

  field :from_params, 7, repeated: true, type: :string, json_name: "fromParams"
  field :forward_payload_header, 8, type: :string, json_name: "forwardPayloadHeader"
  field :payload_in_metadata, 9, type: :string, json_name: "payloadInMetadata"
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RemoteJwks do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_uri, 1, type: Envoy.Api.V2.Core.HttpUri, json_name: "httpUri"
  field :cache_duration, 2, type: Google.Protobuf.Duration, json_name: "cacheDuration"
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtHeader do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :value_prefix, 2, type: :string, json_name: "valuePrefix"
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.ProviderWithAudiences do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :provider_name, 1, type: :string, json_name: "providerName"
  field :audiences, 2, repeated: true, type: :string
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :requires_type, 0

  field :provider_name, 1, type: :string, json_name: "providerName", oneof: 0

  field :provider_and_audiences, 2,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.ProviderWithAudiences,
    json_name: "providerAndAudiences",
    oneof: 0

  field :requires_any, 3,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementOrList,
    json_name: "requiresAny",
    oneof: 0

  field :requires_all, 4,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementAndList,
    json_name: "requiresAll",
    oneof: 0

  field :allow_missing_or_failed, 5,
    type: Google.Protobuf.Empty,
    json_name: "allowMissingOrFailed",
    oneof: 0

  field :allow_missing, 6, type: Google.Protobuf.Empty, json_name: "allowMissing", oneof: 0
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementOrList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :requirements, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirementAndList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :requirements, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement,
    deprecated: false
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :match, 1, type: Envoy.Api.V2.Route.RouteMatch, deprecated: false
  field :requires, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.RequiresEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtRequirement
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false

  field :requires, 3,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule.RequiresEntry,
    map: true
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication.ProvidersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtProvider
end

defmodule Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :providers, 1,
    repeated: true,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.JwtAuthentication.ProvidersEntry,
    map: true

  field :rules, 2, repeated: true, type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.RequirementRule

  field :filter_state_rules, 3,
    type: Envoy.Config.Filter.Http.JwtAuthn.V2alpha.FilterStateRule,
    json_name: "filterStateRules"

  field :bypass_cors_preflight, 4, type: :bool, json_name: "bypassCorsPreflight"
end