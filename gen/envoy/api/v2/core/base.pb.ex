defmodule Envoy.Api.V2.Core.RoutingPriority do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :HIGH, 1
end

defmodule Envoy.Api.V2.Core.RequestMethod do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :METHOD_UNSPECIFIED, 0
  field :GET, 1
  field :HEAD, 2
  field :POST, 3
  field :PUT, 4
  field :DELETE, 5
  field :CONNECT, 6
  field :OPTIONS, 7
  field :TRACE, 8
  field :PATCH, 9
end

defmodule Envoy.Api.V2.Core.TrafficDirection do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNSPECIFIED, 0
  field :INBOUND, 1
  field :OUTBOUND, 2
end

defmodule Envoy.Api.V2.Core.Locality do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :region, 1, type: :string
  field :zone, 2, type: :string
  field :sub_zone, 3, type: :string, json_name: "subZone"
end

defmodule Envoy.Api.V2.Core.BuildVersion do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version, 1, type: Envoy.Type.SemanticVersion
  field :metadata, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Core.Extension do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :category, 2, type: :string
  field :type_descriptor, 3, type: :string, json_name: "typeDescriptor"
  field :version, 4, type: Envoy.Api.V2.Core.BuildVersion
  field :disabled, 5, type: :bool
end

defmodule Envoy.Api.V2.Core.Node do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :user_agent_version_type, 0

  field :id, 1, type: :string
  field :cluster, 2, type: :string
  field :metadata, 3, type: Google.Protobuf.Struct
  field :locality, 4, type: Envoy.Api.V2.Core.Locality
  field :build_version, 5, type: :string, json_name: "buildVersion", deprecated: true
  field :user_agent_name, 6, type: :string, json_name: "userAgentName"
  field :user_agent_version, 7, type: :string, json_name: "userAgentVersion", oneof: 0

  field :user_agent_build_version, 8,
    type: Envoy.Api.V2.Core.BuildVersion,
    json_name: "userAgentBuildVersion",
    oneof: 0

  field :extensions, 9, repeated: true, type: Envoy.Api.V2.Core.Extension
  field :client_features, 10, repeated: true, type: :string, json_name: "clientFeatures"

  field :listening_addresses, 11,
    repeated: true,
    type: Envoy.Api.V2.Core.Address,
    json_name: "listeningAddresses"
end

defmodule Envoy.Api.V2.Core.Metadata.FilterMetadataEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Api.V2.Core.Metadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filter_metadata, 1,
    repeated: true,
    type: Envoy.Api.V2.Core.Metadata.FilterMetadataEntry,
    json_name: "filterMetadata",
    map: true
end

defmodule Envoy.Api.V2.Core.RuntimeUInt32 do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 2, type: :uint32, json_name: "defaultValue"
  field :runtime_key, 3, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Api.V2.Core.RuntimeDouble do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 1, type: :double, json_name: "defaultValue"
  field :runtime_key, 2, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Api.V2.Core.RuntimeFeatureFlag do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "defaultValue",
    deprecated: false

  field :runtime_key, 2, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Api.V2.Core.HeaderValue do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
end

defmodule Envoy.Api.V2.Core.HeaderValueOption do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header, 1, type: Envoy.Api.V2.Core.HeaderValue, deprecated: false
  field :append, 2, type: Google.Protobuf.BoolValue
end

defmodule Envoy.Api.V2.Core.HeaderMap do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 1, repeated: true, type: Envoy.Api.V2.Core.HeaderValue
end

defmodule Envoy.Api.V2.Core.DataSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :specifier, 0

  field :filename, 1, type: :string, oneof: 0, deprecated: false
  field :inline_bytes, 2, type: :bytes, json_name: "inlineBytes", oneof: 0, deprecated: false
  field :inline_string, 3, type: :string, json_name: "inlineString", oneof: 0, deprecated: false
end

defmodule Envoy.Api.V2.Core.RetryPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :retry_back_off, 1, type: Envoy.Api.V2.Core.BackoffStrategy, json_name: "retryBackOff"
  field :num_retries, 2, type: Google.Protobuf.UInt32Value, json_name: "numRetries"
end

defmodule Envoy.Api.V2.Core.RemoteDataSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_uri, 1, type: Envoy.Api.V2.Core.HttpUri, json_name: "httpUri", deprecated: false
  field :sha256, 2, type: :string, deprecated: false
  field :retry_policy, 3, type: Envoy.Api.V2.Core.RetryPolicy, json_name: "retryPolicy"
end

defmodule Envoy.Api.V2.Core.AsyncDataSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :specifier, 0

  field :local, 1, type: Envoy.Api.V2.Core.DataSource, oneof: 0
  field :remote, 2, type: Envoy.Api.V2.Core.RemoteDataSource, oneof: 0
end

defmodule Envoy.Api.V2.Core.TransportSocket do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :config, 2, type: Google.Protobuf.Struct, oneof: 0, deprecated: true
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Api.V2.Core.RuntimeFractionalPercent do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 1,
    type: Envoy.Type.FractionalPercent,
    json_name: "defaultValue",
    deprecated: false

  field :runtime_key, 2, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Api.V2.Core.ControlPlane do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: :string
end