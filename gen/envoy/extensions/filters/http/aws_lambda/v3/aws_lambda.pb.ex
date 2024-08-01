defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.Config.InvocationMode do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :SYNCHRONOUS, 0
  field :ASYNCHRONOUS, 1
end

defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.Config do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :arn, 1, type: :string, deprecated: false
  field :payload_passthrough, 2, type: :bool, json_name: "payloadPassthrough"

  field :invocation_mode, 3,
    type: Envoy.Extensions.Filters.Http.AwsLambda.V3.Config.InvocationMode,
    json_name: "invocationMode",
    enum: true,
    deprecated: false

  field :host_rewrite, 4, type: :string, json_name: "hostRewrite"
  field :credentials_profile, 5, type: :string, json_name: "credentialsProfile"
  field :credentials, 6, type: Envoy.Extensions.Filters.Http.AwsLambda.V3.Credentials
end

defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.Credentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :access_key_id, 1, type: :string, json_name: "accessKeyId", deprecated: false
  field :secret_access_key, 2, type: :string, json_name: "secretAccessKey", deprecated: false
  field :session_token, 3, type: :string, json_name: "sessionToken"
end

defmodule Envoy.Extensions.Filters.Http.AwsLambda.V3.PerRouteConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :invoke_config, 1,
    type: Envoy.Extensions.Filters.Http.AwsLambda.V3.Config,
    json_name: "invokeConfig"
end