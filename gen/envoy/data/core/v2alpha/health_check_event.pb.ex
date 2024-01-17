defmodule Envoy.Data.Core.V2alpha.HealthCheckFailureType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ACTIVE, 0
  field :PASSIVE, 1
  field :NETWORK, 2
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckerType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :HTTP, 0
  field :TCP, 1
  field :GRPC, 2
  field :REDIS, 3
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckEvent do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :event, 0

  field :health_checker_type, 1,
    type: Envoy.Data.Core.V2alpha.HealthCheckerType,
    json_name: "healthCheckerType",
    enum: true,
    deprecated: false

  field :host, 2, type: Envoy.Api.V2.Core.Address
  field :cluster_name, 3, type: :string, json_name: "clusterName", deprecated: false

  field :eject_unhealthy_event, 4,
    type: Envoy.Data.Core.V2alpha.HealthCheckEjectUnhealthy,
    json_name: "ejectUnhealthyEvent",
    oneof: 0

  field :add_healthy_event, 5,
    type: Envoy.Data.Core.V2alpha.HealthCheckAddHealthy,
    json_name: "addHealthyEvent",
    oneof: 0

  field :health_check_failure_event, 7,
    type: Envoy.Data.Core.V2alpha.HealthCheckFailure,
    json_name: "healthCheckFailureEvent",
    oneof: 0

  field :degraded_healthy_host, 8,
    type: Envoy.Data.Core.V2alpha.DegradedHealthyHost,
    json_name: "degradedHealthyHost",
    oneof: 0

  field :no_longer_degraded_host, 9,
    type: Envoy.Data.Core.V2alpha.NoLongerDegradedHost,
    json_name: "noLongerDegradedHost",
    oneof: 0

  field :timestamp, 6, type: Google.Protobuf.Timestamp
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckEjectUnhealthy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :failure_type, 1,
    type: Envoy.Data.Core.V2alpha.HealthCheckFailureType,
    json_name: "failureType",
    enum: true,
    deprecated: false
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckAddHealthy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :first_check, 1, type: :bool, json_name: "firstCheck"
end

defmodule Envoy.Data.Core.V2alpha.HealthCheckFailure do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :failure_type, 1,
    type: Envoy.Data.Core.V2alpha.HealthCheckFailureType,
    json_name: "failureType",
    enum: true,
    deprecated: false

  field :first_check, 2, type: :bool, json_name: "firstCheck"
end

defmodule Envoy.Data.Core.V2alpha.DegradedHealthyHost do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Data.Core.V2alpha.NoLongerDegradedHost do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end