defmodule Envoy.Extensions.Filters.Http.Cors.V3.Cors do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Http.Cors.V3.CorsPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allow_origin_string_match, 1,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "allowOriginStringMatch"

  field :allow_methods, 2, type: :string, json_name: "allowMethods"
  field :allow_headers, 3, type: :string, json_name: "allowHeaders"
  field :expose_headers, 4, type: :string, json_name: "exposeHeaders"
  field :max_age, 5, type: :string, json_name: "maxAge"
  field :allow_credentials, 6, type: Google.Protobuf.BoolValue, json_name: "allowCredentials"

  field :filter_enabled, 7,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled"

  field :shadow_enabled, 8,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "shadowEnabled"

  field :allow_private_network_access, 9,
    type: Google.Protobuf.BoolValue,
    json_name: "allowPrivateNetworkAccess"

  field :forward_not_matching_preflights, 10,
    type: Google.Protobuf.BoolValue,
    json_name: "forwardNotMatchingPreflights"
end