defmodule Envoy.Config.Trace.V3.XRayConfig.SegmentFields do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :origin, 1, type: :string
  field :aws, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Config.Trace.V3.XRayConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :daemon_endpoint, 1, type: Envoy.Config.Core.V3.SocketAddress, json_name: "daemonEndpoint"
  field :segment_name, 2, type: :string, json_name: "segmentName", deprecated: false

  field :sampling_rule_manifest, 3,
    type: Envoy.Config.Core.V3.DataSource,
    json_name: "samplingRuleManifest"

  field :segment_fields, 4,
    type: Envoy.Config.Trace.V3.XRayConfig.SegmentFields,
    json_name: "segmentFields"
end