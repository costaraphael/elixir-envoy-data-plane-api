defmodule Envoy.Config.Filter.Http.Cache.V2alpha.CacheConfig.KeyCreatorParams do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :exclude_scheme, 1, type: :bool, json_name: "excludeScheme"
  field :exclude_host, 2, type: :bool, json_name: "excludeHost"

  field :query_parameters_included, 3,
    repeated: true,
    type: Envoy.Api.V2.Route.QueryParameterMatcher,
    json_name: "queryParametersIncluded"

  field :query_parameters_excluded, 4,
    repeated: true,
    type: Envoy.Api.V2.Route.QueryParameterMatcher,
    json_name: "queryParametersExcluded"
end

defmodule Envoy.Config.Filter.Http.Cache.V2alpha.CacheConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :typed_config, 1, type: Google.Protobuf.Any, json_name: "typedConfig", deprecated: false

  field :allowed_vary_headers, 2,
    repeated: true,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "allowedVaryHeaders"

  field :key_creator_params, 3,
    type: Envoy.Config.Filter.Http.Cache.V2alpha.CacheConfig.KeyCreatorParams,
    json_name: "keyCreatorParams"

  field :max_body_bytes, 4, type: :uint32, json_name: "maxBodyBytes"
end