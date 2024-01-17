defmodule Envoy.Admin.V3.Clusters do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_statuses, 1,
    repeated: true,
    type: Envoy.Admin.V3.ClusterStatus,
    json_name: "clusterStatuses"
end

defmodule Envoy.Admin.V3.ClusterStatus do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :added_via_api, 2, type: :bool, json_name: "addedViaApi"

  field :success_rate_ejection_threshold, 3,
    type: Envoy.Type.V3.Percent,
    json_name: "successRateEjectionThreshold"

  field :host_statuses, 4,
    repeated: true,
    type: Envoy.Admin.V3.HostStatus,
    json_name: "hostStatuses"

  field :local_origin_success_rate_ejection_threshold, 5,
    type: Envoy.Type.V3.Percent,
    json_name: "localOriginSuccessRateEjectionThreshold"

  field :circuit_breakers, 6,
    type: Envoy.Config.Cluster.V3.CircuitBreakers,
    json_name: "circuitBreakers"

  field :observability_name, 7, type: :string, json_name: "observabilityName"
  field :eds_service_name, 8, type: :string, json_name: "edsServiceName"
end

defmodule Envoy.Admin.V3.HostStatus do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :address, 1, type: Envoy.Config.Core.V3.Address
  field :stats, 2, repeated: true, type: Envoy.Admin.V3.SimpleMetric
  field :health_status, 3, type: Envoy.Admin.V3.HostHealthStatus, json_name: "healthStatus"
  field :success_rate, 4, type: Envoy.Type.V3.Percent, json_name: "successRate"
  field :weight, 5, type: :uint32
  field :hostname, 6, type: :string
  field :priority, 7, type: :uint32

  field :local_origin_success_rate, 8,
    type: Envoy.Type.V3.Percent,
    json_name: "localOriginSuccessRate"

  field :locality, 9, type: Envoy.Config.Core.V3.Locality
end

defmodule Envoy.Admin.V3.HostHealthStatus do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :failed_active_health_check, 1, type: :bool, json_name: "failedActiveHealthCheck"
  field :failed_outlier_check, 2, type: :bool, json_name: "failedOutlierCheck"
  field :failed_active_degraded_check, 4, type: :bool, json_name: "failedActiveDegradedCheck"
  field :pending_dynamic_removal, 5, type: :bool, json_name: "pendingDynamicRemoval"
  field :pending_active_hc, 6, type: :bool, json_name: "pendingActiveHc"
  field :excluded_via_immediate_hc_fail, 7, type: :bool, json_name: "excludedViaImmediateHcFail"
  field :active_hc_timeout, 8, type: :bool, json_name: "activeHcTimeout"

  field :eds_health_status, 3,
    type: Envoy.Config.Core.V3.HealthStatus,
    json_name: "edsHealthStatus",
    enum: true
end