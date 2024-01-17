defmodule Envoy.Config.Filter.Network.ExtAuthz.V2.ExtAuthz do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stat_prefix, 1, type: :string, json_name: "statPrefix", deprecated: false
  field :grpc_service, 2, type: Envoy.Api.V2.Core.GrpcService, json_name: "grpcService"
  field :failure_mode_allow, 3, type: :bool, json_name: "failureModeAllow"
  field :include_peer_certificate, 4, type: :bool, json_name: "includePeerCertificate"
end