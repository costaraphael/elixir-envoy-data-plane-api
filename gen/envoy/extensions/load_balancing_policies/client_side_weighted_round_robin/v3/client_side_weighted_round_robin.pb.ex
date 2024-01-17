defmodule Envoy.Extensions.LoadBalancingPolicies.ClientSideWeightedRoundRobin.V3.ClientSideWeightedRoundRobin do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :enable_oob_load_report, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "enableOobLoadReport"

  field :oob_reporting_period, 2, type: Google.Protobuf.Duration, json_name: "oobReportingPeriod"
  field :blackout_period, 3, type: Google.Protobuf.Duration, json_name: "blackoutPeriod"

  field :weight_expiration_period, 4,
    type: Google.Protobuf.Duration,
    json_name: "weightExpirationPeriod"

  field :weight_update_period, 5, type: Google.Protobuf.Duration, json_name: "weightUpdatePeriod"

  field :error_utilization_penalty, 6,
    type: Google.Protobuf.FloatValue,
    json_name: "errorUtilizationPenalty",
    deprecated: false
end