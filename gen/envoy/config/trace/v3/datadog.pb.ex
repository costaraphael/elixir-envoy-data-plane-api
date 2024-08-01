defmodule Envoy.Config.Trace.V3.DatadogRemoteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :polling_interval, 1, type: Google.Protobuf.Duration, json_name: "pollingInterval"
end

defmodule Envoy.Config.Trace.V3.DatadogConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :collector_cluster, 1, type: :string, json_name: "collectorCluster", deprecated: false
  field :service_name, 2, type: :string, json_name: "serviceName", deprecated: false
  field :collector_hostname, 3, type: :string, json_name: "collectorHostname"

  field :remote_config, 4,
    type: Envoy.Config.Trace.V3.DatadogRemoteConfig,
    json_name: "remoteConfig"
end