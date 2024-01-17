defmodule Envoy.Extensions.Filters.Http.Csrf.V3.CsrfPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filter_enabled, 1,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "filterEnabled",
    deprecated: false

  field :shadow_enabled, 2,
    type: Envoy.Config.Core.V3.RuntimeFractionalPercent,
    json_name: "shadowEnabled"

  field :additional_origins, 3,
    repeated: true,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "additionalOrigins"
end