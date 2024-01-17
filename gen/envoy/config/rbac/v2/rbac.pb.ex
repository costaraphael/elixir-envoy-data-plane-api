defmodule Envoy.Config.Rbac.V2.RBAC.Action do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ALLOW, 0
  field :DENY, 1
end

defmodule Envoy.Config.Rbac.V2.RBAC.PoliciesEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Rbac.V2.Policy
end

defmodule Envoy.Config.Rbac.V2.RBAC do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :action, 1, type: Envoy.Config.Rbac.V2.RBAC.Action, enum: true
  field :policies, 2, repeated: true, type: Envoy.Config.Rbac.V2.RBAC.PoliciesEntry, map: true
end

defmodule Envoy.Config.Rbac.V2.Policy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :permissions, 1, repeated: true, type: Envoy.Config.Rbac.V2.Permission, deprecated: false
  field :principals, 2, repeated: true, type: Envoy.Config.Rbac.V2.Principal, deprecated: false
  field :condition, 3, type: Google.Api.Expr.V1alpha1.Expr
end

defmodule Envoy.Config.Rbac.V2.Permission.Set do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1, repeated: true, type: Envoy.Config.Rbac.V2.Permission, deprecated: false
end

defmodule Envoy.Config.Rbac.V2.Permission do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :and_rules, 1, type: Envoy.Config.Rbac.V2.Permission.Set, json_name: "andRules", oneof: 0
  field :or_rules, 2, type: Envoy.Config.Rbac.V2.Permission.Set, json_name: "orRules", oneof: 0
  field :any, 3, type: :bool, oneof: 0, deprecated: false
  field :header, 4, type: Envoy.Api.V2.Route.HeaderMatcher, oneof: 0
  field :url_path, 10, type: Envoy.Type.Matcher.PathMatcher, json_name: "urlPath", oneof: 0

  field :destination_ip, 5,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "destinationIp",
    oneof: 0

  field :destination_port, 6,
    type: :uint32,
    json_name: "destinationPort",
    oneof: 0,
    deprecated: false

  field :metadata, 7, type: Envoy.Type.Matcher.MetadataMatcher, oneof: 0
  field :not_rule, 8, type: Envoy.Config.Rbac.V2.Permission, json_name: "notRule", oneof: 0

  field :requested_server_name, 9,
    type: Envoy.Type.Matcher.StringMatcher,
    json_name: "requestedServerName",
    oneof: 0
end

defmodule Envoy.Config.Rbac.V2.Principal.Set do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ids, 1, repeated: true, type: Envoy.Config.Rbac.V2.Principal, deprecated: false
end

defmodule Envoy.Config.Rbac.V2.Principal.Authenticated do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :principal_name, 2, type: Envoy.Type.Matcher.StringMatcher, json_name: "principalName"
end

defmodule Envoy.Config.Rbac.V2.Principal do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :identifier, 0

  field :and_ids, 1, type: Envoy.Config.Rbac.V2.Principal.Set, json_name: "andIds", oneof: 0
  field :or_ids, 2, type: Envoy.Config.Rbac.V2.Principal.Set, json_name: "orIds", oneof: 0
  field :any, 3, type: :bool, oneof: 0, deprecated: false
  field :authenticated, 4, type: Envoy.Config.Rbac.V2.Principal.Authenticated, oneof: 0

  field :source_ip, 5,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "sourceIp",
    oneof: 0,
    deprecated: true

  field :direct_remote_ip, 10,
    type: Envoy.Api.V2.Core.CidrRange,
    json_name: "directRemoteIp",
    oneof: 0

  field :remote_ip, 11, type: Envoy.Api.V2.Core.CidrRange, json_name: "remoteIp", oneof: 0
  field :header, 6, type: Envoy.Api.V2.Route.HeaderMatcher, oneof: 0
  field :url_path, 9, type: Envoy.Type.Matcher.PathMatcher, json_name: "urlPath", oneof: 0
  field :metadata, 7, type: Envoy.Type.Matcher.MetadataMatcher, oneof: 0
  field :not_id, 8, type: Envoy.Config.Rbac.V2.Principal, json_name: "notId", oneof: 0
end