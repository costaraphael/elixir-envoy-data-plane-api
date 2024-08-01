defmodule Envoy.Extensions.Tracers.Opentelemetry.Samplers.V3.DynatraceSamplerConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tenant, 1, type: :string
  field :cluster_id, 2, type: :int32, json_name: "clusterId"
  field :http_service, 3, type: Envoy.Config.Core.V3.HttpService, json_name: "httpService"
  field :root_spans_per_minute, 4, type: :uint32, json_name: "rootSpansPerMinute"
end