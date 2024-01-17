defmodule Envoy.Extensions.Filters.Http.Rbac.V3.RBAC do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1, type: Envoy.Config.Rbac.V3.RBAC, deprecated: false
  field :matcher, 4, type: Xds.Type.Matcher.V3.Matcher, deprecated: false

  field :shadow_rules, 2,
    type: Envoy.Config.Rbac.V3.RBAC,
    json_name: "shadowRules",
    deprecated: false

  field :shadow_matcher, 5,
    type: Xds.Type.Matcher.V3.Matcher,
    json_name: "shadowMatcher",
    deprecated: false

  field :shadow_rules_stat_prefix, 3, type: :string, json_name: "shadowRulesStatPrefix"
end

defmodule Envoy.Extensions.Filters.Http.Rbac.V3.RBACPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rbac, 2, type: Envoy.Extensions.Filters.Http.Rbac.V3.RBAC
end