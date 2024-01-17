defmodule Envoy.Config.Filter.Http.Rbac.V2.RBAC do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1, type: Envoy.Config.Rbac.V2.RBAC
  field :shadow_rules, 2, type: Envoy.Config.Rbac.V2.RBAC, json_name: "shadowRules"
end

defmodule Envoy.Config.Filter.Http.Rbac.V2.RBACPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rbac, 2, type: Envoy.Config.Filter.Http.Rbac.V2.RBAC
end