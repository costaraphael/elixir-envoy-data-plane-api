defmodule Envoy.Config.Cluster.V3.OutlierDetection do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :consecutive_5xx, 1, type: Google.Protobuf.UInt32Value, json_name: "consecutive5xx"
  field :interval, 2, type: Google.Protobuf.Duration, deprecated: false

  field :base_ejection_time, 3,
    type: Google.Protobuf.Duration,
    json_name: "baseEjectionTime",
    deprecated: false

  field :max_ejection_percent, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "maxEjectionPercent",
    deprecated: false

  field :enforcing_consecutive_5xx, 5,
    type: Google.Protobuf.UInt32Value,
    json_name: "enforcingConsecutive5xx",
    deprecated: false

  field :enforcing_success_rate, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "enforcingSuccessRate",
    deprecated: false

  field :success_rate_minimum_hosts, 7,
    type: Google.Protobuf.UInt32Value,
    json_name: "successRateMinimumHosts"

  field :success_rate_request_volume, 8,
    type: Google.Protobuf.UInt32Value,
    json_name: "successRateRequestVolume"

  field :success_rate_stdev_factor, 9,
    type: Google.Protobuf.UInt32Value,
    json_name: "successRateStdevFactor"

  field :consecutive_gateway_failure, 10,
    type: Google.Protobuf.UInt32Value,
    json_name: "consecutiveGatewayFailure"

  field :enforcing_consecutive_gateway_failure, 11,
    type: Google.Protobuf.UInt32Value,
    json_name: "enforcingConsecutiveGatewayFailure",
    deprecated: false

  field :split_external_local_origin_errors, 12,
    type: :bool,
    json_name: "splitExternalLocalOriginErrors"

  field :consecutive_local_origin_failure, 13,
    type: Google.Protobuf.UInt32Value,
    json_name: "consecutiveLocalOriginFailure"

  field :enforcing_consecutive_local_origin_failure, 14,
    type: Google.Protobuf.UInt32Value,
    json_name: "enforcingConsecutiveLocalOriginFailure",
    deprecated: false

  field :enforcing_local_origin_success_rate, 15,
    type: Google.Protobuf.UInt32Value,
    json_name: "enforcingLocalOriginSuccessRate",
    deprecated: false

  field :failure_percentage_threshold, 16,
    type: Google.Protobuf.UInt32Value,
    json_name: "failurePercentageThreshold",
    deprecated: false

  field :enforcing_failure_percentage, 17,
    type: Google.Protobuf.UInt32Value,
    json_name: "enforcingFailurePercentage",
    deprecated: false

  field :enforcing_failure_percentage_local_origin, 18,
    type: Google.Protobuf.UInt32Value,
    json_name: "enforcingFailurePercentageLocalOrigin",
    deprecated: false

  field :failure_percentage_minimum_hosts, 19,
    type: Google.Protobuf.UInt32Value,
    json_name: "failurePercentageMinimumHosts"

  field :failure_percentage_request_volume, 20,
    type: Google.Protobuf.UInt32Value,
    json_name: "failurePercentageRequestVolume"

  field :max_ejection_time, 21,
    type: Google.Protobuf.Duration,
    json_name: "maxEjectionTime",
    deprecated: false

  field :max_ejection_time_jitter, 22,
    type: Google.Protobuf.Duration,
    json_name: "maxEjectionTimeJitter"

  field :successful_active_health_check_uneject_host, 23,
    type: Google.Protobuf.BoolValue,
    json_name: "successfulActiveHealthCheckUnejectHost"

  field :monitors, 24, repeated: true, type: Envoy.Config.Core.V3.TypedExtensionConfig

  field :always_eject_one_host, 25,
    type: Google.Protobuf.BoolValue,
    json_name: "alwaysEjectOneHost"
end