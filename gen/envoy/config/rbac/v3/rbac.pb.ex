defmodule Envoy.Config.Rbac.V3.RBAC.Action do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ALLOW, 0
  field :DENY, 1
  field :LOG, 2
end

defmodule Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions.AuditCondition do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :NONE, 0
  field :ON_DENY, 1
  field :ON_ALLOW, 2
  field :ON_DENY_AND_ALLOW, 3
end

defmodule Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions.AuditLoggerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :audit_logger, 1,
    type: Envoy.Config.Core.V3.TypedExtensionConfig,
    json_name: "auditLogger"

  field :is_optional, 2, type: :bool, json_name: "isOptional"
end

defmodule Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :audit_condition, 1,
    type: Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions.AuditCondition,
    json_name: "auditCondition",
    enum: true,
    deprecated: false

  field :logger_configs, 2,
    repeated: true,
    type: Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions.AuditLoggerConfig,
    json_name: "loggerConfigs"
end

defmodule Envoy.Config.Rbac.V3.RBAC.PoliciesEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Envoy.Config.Rbac.V3.Policy
end

defmodule Envoy.Config.Rbac.V3.RBAC do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :action, 1, type: Envoy.Config.Rbac.V3.RBAC.Action, enum: true, deprecated: false
  field :policies, 2, repeated: true, type: Envoy.Config.Rbac.V3.RBAC.PoliciesEntry, map: true

  field :audit_logging_options, 3,
    type: Envoy.Config.Rbac.V3.RBAC.AuditLoggingOptions,
    json_name: "auditLoggingOptions"
end

defmodule Envoy.Config.Rbac.V3.Policy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :permissions, 1, repeated: true, type: Envoy.Config.Rbac.V3.Permission, deprecated: false
  field :principals, 2, repeated: true, type: Envoy.Config.Rbac.V3.Principal, deprecated: false
  field :condition, 3, type: Google.Api.Expr.V1alpha1.Expr, deprecated: false

  field :checked_condition, 4,
    type: Google.Api.Expr.V1alpha1.CheckedExpr,
    json_name: "checkedCondition",
    deprecated: false
end

defmodule Envoy.Config.Rbac.V3.Permission.Set do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rules, 1, repeated: true, type: Envoy.Config.Rbac.V3.Permission, deprecated: false
end

defmodule Envoy.Config.Rbac.V3.Permission do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :rule, 0

  field :and_rules, 1, type: Envoy.Config.Rbac.V3.Permission.Set, json_name: "andRules", oneof: 0
  field :or_rules, 2, type: Envoy.Config.Rbac.V3.Permission.Set, json_name: "orRules", oneof: 0
  field :any, 3, type: :bool, oneof: 0, deprecated: false
  field :header, 4, type: Envoy.Config.Route.V3.HeaderMatcher, oneof: 0
  field :url_path, 10, type: Envoy.Type.Matcher.V3.PathMatcher, json_name: "urlPath", oneof: 0

  field :destination_ip, 5,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "destinationIp",
    oneof: 0

  field :destination_port, 6,
    type: :uint32,
    json_name: "destinationPort",
    oneof: 0,
    deprecated: false

  field :destination_port_range, 11,
    type: Envoy.Type.V3.Int32Range,
    json_name: "destinationPortRange",
    oneof: 0

  field :metadata, 7, type: Envoy.Type.Matcher.V3.MetadataMatcher, oneof: 0
  field :not_rule, 8, type: Envoy.Config.Rbac.V3.Permission, json_name: "notRule", oneof: 0

  field :requested_server_name, 9,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "requestedServerName",
    oneof: 0

  field :matcher, 12, type: Envoy.Config.Core.V3.TypedExtensionConfig, oneof: 0
end

defmodule Envoy.Config.Rbac.V3.Principal.Set do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ids, 1, repeated: true, type: Envoy.Config.Rbac.V3.Principal, deprecated: false
end

defmodule Envoy.Config.Rbac.V3.Principal.Authenticated do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :principal_name, 2, type: Envoy.Type.Matcher.V3.StringMatcher, json_name: "principalName"
end

defmodule Envoy.Config.Rbac.V3.Principal do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :identifier, 0

  field :and_ids, 1, type: Envoy.Config.Rbac.V3.Principal.Set, json_name: "andIds", oneof: 0
  field :or_ids, 2, type: Envoy.Config.Rbac.V3.Principal.Set, json_name: "orIds", oneof: 0
  field :any, 3, type: :bool, oneof: 0, deprecated: false
  field :authenticated, 4, type: Envoy.Config.Rbac.V3.Principal.Authenticated, oneof: 0

  field :source_ip, 5,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "sourceIp",
    oneof: 0,
    deprecated: true

  field :direct_remote_ip, 10,
    type: Envoy.Config.Core.V3.CidrRange,
    json_name: "directRemoteIp",
    oneof: 0

  field :remote_ip, 11, type: Envoy.Config.Core.V3.CidrRange, json_name: "remoteIp", oneof: 0
  field :header, 6, type: Envoy.Config.Route.V3.HeaderMatcher, oneof: 0
  field :url_path, 9, type: Envoy.Type.Matcher.V3.PathMatcher, json_name: "urlPath", oneof: 0
  field :metadata, 7, type: Envoy.Type.Matcher.V3.MetadataMatcher, oneof: 0

  field :filter_state, 12,
    type: Envoy.Type.Matcher.V3.FilterStateMatcher,
    json_name: "filterState",
    oneof: 0

  field :not_id, 8, type: Envoy.Config.Rbac.V3.Principal, json_name: "notId", oneof: 0
end

defmodule Envoy.Config.Rbac.V3.Action do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :action, 2, type: Envoy.Config.Rbac.V3.RBAC.Action, enum: true
end