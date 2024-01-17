defmodule Envoy.Extensions.Filters.Network.ZookeeperProxy.V3.LatencyThresholdOverride.Opcode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :Connect, 0
  field :Create, 1
  field :Delete, 2
  field :Exists, 3
  field :GetData, 4
  field :SetData, 5
  field :GetAcl, 6
  field :SetAcl, 7
  field :GetChildren, 8
  field :Sync, 9
  field :Ping, 10
  field :GetChildren2, 11
  field :Check, 12
  field :Multi, 13
  field :Create2, 14
  field :Reconfig, 15
  field :CheckWatches, 16
  field :RemoveWatches, 17
  field :CreateContainer, 18
  field :CreateTtl, 19
  field :Close, 20
  field :SetAuth, 21
  field :SetWatches, 22
  field :GetEphemerals, 23
  field :GetAllChildrenNumber, 24
  field :SetWatches2, 25
  field :AddWatch, 26
end

defmodule Envoy.Extensions.Filters.Network.ZookeeperProxy.V3.ZooKeeperProxy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :access_log, 2, type: :string, json_name: "accessLog"
  field :max_packet_bytes, 3, type: Google.Protobuf.UInt32Value, json_name: "maxPacketBytes"

  field :enable_latency_threshold_metrics, 4,
    type: :bool,
    json_name: "enableLatencyThresholdMetrics"

  field :default_latency_threshold, 5,
    type: Google.Protobuf.Duration,
    json_name: "defaultLatencyThreshold",
    deprecated: false

  field :latency_threshold_overrides, 6,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.ZookeeperProxy.V3.LatencyThresholdOverride,
    json_name: "latencyThresholdOverrides"

  field :enable_per_opcode_request_bytes_metrics, 7,
    type: :bool,
    json_name: "enablePerOpcodeRequestBytesMetrics"

  field :enable_per_opcode_response_bytes_metrics, 8,
    type: :bool,
    json_name: "enablePerOpcodeResponseBytesMetrics"

  field :enable_per_opcode_decoder_error_metrics, 9,
    type: :bool,
    json_name: "enablePerOpcodeDecoderErrorMetrics"
end

defmodule Envoy.Extensions.Filters.Network.ZookeeperProxy.V3.LatencyThresholdOverride do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :opcode, 1,
    type: Envoy.Extensions.Filters.Network.ZookeeperProxy.V3.LatencyThresholdOverride.Opcode,
    enum: true,
    deprecated: false

  field :threshold, 2, type: Google.Protobuf.Duration, deprecated: false
end