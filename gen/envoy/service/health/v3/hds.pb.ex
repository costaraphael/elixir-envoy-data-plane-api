defmodule Envoy.Service.Health.V3.Capability.Protocol do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :HTTP, 0
  field :TCP, 1
  field :REDIS, 2
end

defmodule Envoy.Service.Health.V3.Capability do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :health_check_protocols, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.Capability.Protocol,
    json_name: "healthCheckProtocols",
    enum: true
end

defmodule Envoy.Service.Health.V3.HealthCheckRequest do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node, 1, type: Envoy.Config.Core.V3.Node
  field :capability, 2, type: Envoy.Service.Health.V3.Capability
end

defmodule Envoy.Service.Health.V3.EndpointHealth do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :endpoint, 1, type: Envoy.Config.Endpoint.V3.Endpoint

  field :health_status, 2,
    type: Envoy.Config.Core.V3.HealthStatus,
    json_name: "healthStatus",
    enum: true
end

defmodule Envoy.Service.Health.V3.LocalityEndpointsHealth do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :locality, 1, type: Envoy.Config.Core.V3.Locality

  field :endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.EndpointHealth,
    json_name: "endpointsHealth"
end

defmodule Envoy.Service.Health.V3.ClusterEndpointsHealth do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_name, 1, type: :string, json_name: "clusterName"

  field :locality_endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.LocalityEndpointsHealth,
    json_name: "localityEndpointsHealth"
end

defmodule Envoy.Service.Health.V3.EndpointHealthResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :endpoints_health, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.EndpointHealth,
    json_name: "endpointsHealth",
    deprecated: true

  field :cluster_endpoints_health, 2,
    repeated: true,
    type: Envoy.Service.Health.V3.ClusterEndpointsHealth,
    json_name: "clusterEndpointsHealth"
end

defmodule Envoy.Service.Health.V3.HealthCheckRequestOrEndpointHealthResponse do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :request_type, 0

  field :health_check_request, 1,
    type: Envoy.Service.Health.V3.HealthCheckRequest,
    json_name: "healthCheckRequest",
    oneof: 0

  field :endpoint_health_response, 2,
    type: Envoy.Service.Health.V3.EndpointHealthResponse,
    json_name: "endpointHealthResponse",
    oneof: 0
end

defmodule Envoy.Service.Health.V3.LocalityEndpoints do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :locality, 1, type: Envoy.Config.Core.V3.Locality
  field :endpoints, 2, repeated: true, type: Envoy.Config.Endpoint.V3.Endpoint
end

defmodule Envoy.Service.Health.V3.ClusterHealthCheck do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_name, 1, type: :string, json_name: "clusterName"

  field :health_checks, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.HealthCheck,
    json_name: "healthChecks"

  field :locality_endpoints, 3,
    repeated: true,
    type: Envoy.Service.Health.V3.LocalityEndpoints,
    json_name: "localityEndpoints"

  field :transport_socket_matches, 4,
    repeated: true,
    type: Envoy.Config.Cluster.V3.Cluster.TransportSocketMatch,
    json_name: "transportSocketMatches"

  field :upstream_bind_config, 5,
    type: Envoy.Config.Core.V3.BindConfig,
    json_name: "upstreamBindConfig"
end

defmodule Envoy.Service.Health.V3.HealthCheckSpecifier do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_health_checks, 1,
    repeated: true,
    type: Envoy.Service.Health.V3.ClusterHealthCheck,
    json_name: "clusterHealthChecks"

  field :interval, 2, type: Google.Protobuf.Duration
end

defmodule Envoy.Service.Health.V3.HdsDummy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Service.Health.V3.HealthDiscoveryService.Service do
  use GRPC.Service,
    name: "envoy.service.health.v3.HealthDiscoveryService",
    protoc_gen_elixir_version: "0.12.0"

  rpc :StreamHealthCheck,
      stream(Envoy.Service.Health.V3.HealthCheckRequestOrEndpointHealthResponse),
      stream(Envoy.Service.Health.V3.HealthCheckSpecifier)

  rpc :FetchHealthCheck,
      Envoy.Service.Health.V3.HealthCheckRequestOrEndpointHealthResponse,
      Envoy.Service.Health.V3.HealthCheckSpecifier
end

defmodule Envoy.Service.Health.V3.HealthDiscoveryService.Stub do
  use GRPC.Stub, service: Envoy.Service.Health.V3.HealthDiscoveryService.Service
end