defmodule Envoy.Config.Filter.Http.GrpcHttp1ReverseBridge.V2alpha1.FilterConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :content_type, 1, type: :string, json_name: "contentType", deprecated: false
  field :withhold_grpc_frames, 2, type: :bool, json_name: "withholdGrpcFrames"
end

defmodule Envoy.Config.Filter.Http.GrpcHttp1ReverseBridge.V2alpha1.FilterConfigPerRoute do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :disabled, 1, type: :bool
end