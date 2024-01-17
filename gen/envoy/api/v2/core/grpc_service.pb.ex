defmodule Envoy.Api.V2.Core.GrpcService.EnvoyGrpc do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster_name, 1, type: :string, json_name: "clusterName", deprecated: false
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc.SslCredentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :root_certs, 1, type: Envoy.Api.V2.Core.DataSource, json_name: "rootCerts"

  field :private_key, 2,
    type: Envoy.Api.V2.Core.DataSource,
    json_name: "privateKey",
    deprecated: false

  field :cert_chain, 3, type: Envoy.Api.V2.Core.DataSource, json_name: "certChain"
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc.GoogleLocalCredentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc.ChannelCredentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :credential_specifier, 0

  field :ssl_credentials, 1,
    type: Envoy.Api.V2.Core.GrpcService.GoogleGrpc.SslCredentials,
    json_name: "sslCredentials",
    oneof: 0

  field :google_default, 2, type: Google.Protobuf.Empty, json_name: "googleDefault", oneof: 0

  field :local_credentials, 3,
    type: Envoy.Api.V2.Core.GrpcService.GoogleGrpc.GoogleLocalCredentials,
    json_name: "localCredentials",
    oneof: 0
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :json_key, 1, type: :string, json_name: "jsonKey"
  field :token_lifetime_seconds, 2, type: :uint64, json_name: "tokenLifetimeSeconds"
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :authorization_token, 1, type: :string, json_name: "authorizationToken"
  field :authority_selector, 2, type: :string, json_name: "authoritySelector"
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials.StsService do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :token_exchange_service_uri, 1, type: :string, json_name: "tokenExchangeServiceUri"
  field :resource, 2, type: :string
  field :audience, 3, type: :string
  field :scope, 4, type: :string
  field :requested_token_type, 5, type: :string, json_name: "requestedTokenType"
  field :subject_token_path, 6, type: :string, json_name: "subjectTokenPath", deprecated: false
  field :subject_token_type, 7, type: :string, json_name: "subjectTokenType", deprecated: false
  field :actor_token_path, 8, type: :string, json_name: "actorTokenPath"
  field :actor_token_type, 9, type: :string, json_name: "actorTokenType"
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :credential_specifier, 0

  field :access_token, 1, type: :string, json_name: "accessToken", oneof: 0

  field :google_compute_engine, 2,
    type: Google.Protobuf.Empty,
    json_name: "googleComputeEngine",
    oneof: 0

  field :google_refresh_token, 3, type: :string, json_name: "googleRefreshToken", oneof: 0

  field :service_account_jwt_access, 4,
    type:
      Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials.ServiceAccountJWTAccessCredentials,
    json_name: "serviceAccountJwtAccess",
    oneof: 0

  field :google_iam, 5,
    type: Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials.GoogleIAMCredentials,
    json_name: "googleIam",
    oneof: 0

  field :from_plugin, 6,
    type: Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials.MetadataCredentialsFromPlugin,
    json_name: "fromPlugin",
    oneof: 0

  field :sts_service, 7,
    type: Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials.StsService,
    json_name: "stsService",
    oneof: 0
end

defmodule Envoy.Api.V2.Core.GrpcService.GoogleGrpc do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :target_uri, 1, type: :string, json_name: "targetUri", deprecated: false

  field :channel_credentials, 2,
    type: Envoy.Api.V2.Core.GrpcService.GoogleGrpc.ChannelCredentials,
    json_name: "channelCredentials"

  field :call_credentials, 3,
    repeated: true,
    type: Envoy.Api.V2.Core.GrpcService.GoogleGrpc.CallCredentials,
    json_name: "callCredentials"

  field :stat_prefix, 4, type: :string, json_name: "statPrefix", deprecated: false
  field :credentials_factory_name, 5, type: :string, json_name: "credentialsFactoryName"
  field :config, 6, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Core.GrpcService do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :target_specifier, 0

  field :envoy_grpc, 1,
    type: Envoy.Api.V2.Core.GrpcService.EnvoyGrpc,
    json_name: "envoyGrpc",
    oneof: 0

  field :google_grpc, 2,
    type: Envoy.Api.V2.Core.GrpcService.GoogleGrpc,
    json_name: "googleGrpc",
    oneof: 0

  field :timeout, 3, type: Google.Protobuf.Duration

  field :initial_metadata, 5,
    repeated: true,
    type: Envoy.Api.V2.Core.HeaderValue,
    json_name: "initialMetadata"
end