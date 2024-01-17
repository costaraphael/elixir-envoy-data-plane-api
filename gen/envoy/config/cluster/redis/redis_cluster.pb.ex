defmodule Envoy.Config.Cluster.Redis.RedisClusterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_refresh_rate, 1,
    type: Google.Protobuf.Duration,
    json_name: "clusterRefreshRate",
    deprecated: false

  field :cluster_refresh_timeout, 2,
    type: Google.Protobuf.Duration,
    json_name: "clusterRefreshTimeout",
    deprecated: false

  field :redirect_refresh_interval, 3,
    type: Google.Protobuf.Duration,
    json_name: "redirectRefreshInterval"

  field :redirect_refresh_threshold, 4,
    type: Google.Protobuf.UInt32Value,
    json_name: "redirectRefreshThreshold"

  field :failure_refresh_threshold, 5, type: :uint32, json_name: "failureRefreshThreshold"

  field :host_degraded_refresh_threshold, 6,
    type: :uint32,
    json_name: "hostDegradedRefreshThreshold"
end