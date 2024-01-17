defmodule Envoy.Config.Filter.Network.Rbac.V2.RBAC.EnforcementType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ONE_TIME_ON_FIRST_BYTE, 0
  field :CONTINUOUS, 1
end

defmodule Envoy.Config.Filter.Network.Rbac.V2.RBAC do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1, type: Envoy.Config.Rbac.V2.RBAC
  field :shadow_rules, 2, type: Envoy.Config.Rbac.V2.RBAC, json_name: "shadowRules"
  field :stat_prefix, 3, type: :string, json_name: "statPrefix", deprecated: false

  field :enforcement_type, 4,
    type: Envoy.Config.Filter.Network.Rbac.V2.RBAC.EnforcementType,
    json_name: "enforcementType",
    enum: true
end