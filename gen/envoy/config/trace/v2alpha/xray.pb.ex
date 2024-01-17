defmodule Envoy.Config.Trace.V2alpha.XRayConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :daemon_endpoint, 1, type: Envoy.Api.V2.Core.SocketAddress, json_name: "daemonEndpoint"
  field :segment_name, 2, type: :string, json_name: "segmentName", deprecated: false

  field :sampling_rule_manifest, 3,
    type: Envoy.Api.V2.Core.DataSource,
    json_name: "samplingRuleManifest"
end