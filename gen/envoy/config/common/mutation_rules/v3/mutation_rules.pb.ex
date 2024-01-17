defmodule Envoy.Config.Common.MutationRules.V3.HeaderMutationRules do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allow_all_routing, 1, type: Google.Protobuf.BoolValue, json_name: "allowAllRouting"
  field :allow_envoy, 2, type: Google.Protobuf.BoolValue, json_name: "allowEnvoy"
  field :disallow_system, 3, type: Google.Protobuf.BoolValue, json_name: "disallowSystem"
  field :disallow_all, 4, type: Google.Protobuf.BoolValue, json_name: "disallowAll"

  field :allow_expression, 5,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "allowExpression"

  field :disallow_expression, 6,
    type: Envoy.Type.Matcher.V3.RegexMatcher,
    json_name: "disallowExpression"

  field :disallow_is_error, 7, type: Google.Protobuf.BoolValue, json_name: "disallowIsError"
end

defmodule Envoy.Config.Common.MutationRules.V3.HeaderMutation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :action, 0

  field :remove, 1, type: :string, oneof: 0, deprecated: false
  field :append, 2, type: Envoy.Config.Core.V3.HeaderValueOption, oneof: 0
end