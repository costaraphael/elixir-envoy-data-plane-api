defmodule Envoy.Config.Trace.V3.LightstepConfig.PropagationMode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ENVOY, 0
  field :LIGHTSTEP, 1
  field :B3, 2
  field :TRACE_CONTEXT, 3
end

defmodule Envoy.Config.Trace.V3.LightstepConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :collector_cluster, 1, type: :string, json_name: "collectorCluster", deprecated: false
  field :access_token_file, 2, type: :string, json_name: "accessTokenFile", deprecated: true
  field :access_token, 4, type: Envoy.Config.Core.V3.DataSource, json_name: "accessToken"

  field :propagation_modes, 3,
    repeated: true,
    type: Envoy.Config.Trace.V3.LightstepConfig.PropagationMode,
    json_name: "propagationModes",
    enum: true,
    deprecated: false
end