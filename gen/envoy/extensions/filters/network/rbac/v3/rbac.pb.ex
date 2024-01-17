defmodule Envoy.Extensions.Filters.Network.Rbac.V3.RBAC.EnforcementType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ONE_TIME_ON_FIRST_BYTE, 0
  field :CONTINUOUS, 1
end

defmodule Envoy.Extensions.Filters.Network.Rbac.V3.RBAC do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1, type: Envoy.Config.Rbac.V3.RBAC, deprecated: false
  field :matcher, 6, type: Xds.Type.Matcher.V3.Matcher, deprecated: false

  field :shadow_rules, 2,
    type: Envoy.Config.Rbac.V3.RBAC,
    json_name: "shadowRules",
    deprecated: false

  field :shadow_matcher, 7,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "shadowMatcher",
    deprecated: false

  field :shadow_rules_stat_prefix, 5, type: :string, json_name: "shadowRulesStatPrefix"
  field :stat_prefix, 3, type: :string, json_name: "statPrefix", deprecated: false

  field :enforcement_type, 4,
    type: Envoy.Extensions.Filters.Network.Rbac.V3.RBAC.EnforcementType,
    json_name: "enforcementType",
    enum: true
end