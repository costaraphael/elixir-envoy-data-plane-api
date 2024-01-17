defmodule Envoy.Config.Trace.V2.DatadogConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :collector_cluster, 1, type: :string, json_name: "collectorCluster", deprecated: false
  field :service_name, 2, type: :string, json_name: "serviceName", deprecated: false
end