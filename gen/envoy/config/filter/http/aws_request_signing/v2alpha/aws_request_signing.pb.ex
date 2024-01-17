defmodule Envoy.Config.Filter.Http.AwsRequestSigning.V2alpha.AwsRequestSigning do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :service_name, 1, type: :string, json_name: "serviceName", deprecated: false
  field :region, 2, type: :string, deprecated: false
  field :host_rewrite, 3, type: :string, json_name: "hostRewrite"
end