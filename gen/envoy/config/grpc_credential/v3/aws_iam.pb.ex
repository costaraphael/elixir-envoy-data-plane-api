defmodule Envoy.Config.GrpcCredential.V3.AwsIamConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: false
  field :region, 2, type: :string
end