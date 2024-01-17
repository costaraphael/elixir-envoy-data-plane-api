defmodule Envoy.Config.Core.V3.RoutingPriority do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :HIGH, 1
end

defmodule Envoy.Config.Core.V3.RequestMethod do
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

defmodule Envoy.Config.Core.V3.TrafficDirection do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNSPECIFIED, 0
  field :INBOUND, 1
  field :OUTBOUND, 2
end

defmodule Envoy.Config.Core.V3.HeaderValueOption.HeaderAppendAction do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :APPEND_IF_EXISTS_OR_ADD, 0
  field :ADD_IF_ABSENT, 1
  field :OVERWRITE_IF_EXISTS_OR_ADD, 2
  field :OVERWRITE_IF_EXISTS, 3
end

defmodule Envoy.Config.Core.V3.Locality do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :region, 1, type: :string
  field :zone, 2, type: :string
  field :sub_zone, 3, type: :string, json_name: "subZone"
end

defmodule Envoy.Config.Core.V3.BuildVersion do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :version, 1, type: Envoy.Type.V3.SemanticVersion
  field :metadata, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Config.Core.V3.Extension do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
  field :category, 2, type: :string
  field :type_descriptor, 3, type: :string, json_name: "typeDescriptor", deprecated: true
  field :version, 4, type: Envoy.Config.Core.V3.BuildVersion
  field :disabled, 5, type: :bool
  field :type_urls, 6, repeated: true, type: :string, json_name: "typeUrls"
end

defmodule Envoy.Config.Core.V3.Node.DynamicParametersEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Xds.Core.V3.ContextParams
end

defmodule Envoy.Config.Core.V3.Node do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :user_agent_version_type, 0

  field :id, 1, type: :string
  field :cluster, 2, type: :string
  field :metadata, 3, type: Google.Protobuf.Struct

  field :dynamic_parameters, 12,
    repeated: true,
    type: Envoy.Config.Core.V3.Node.DynamicParametersEntry,
    json_name: "dynamicParameters",
    map: true

  field :locality, 4, type: Envoy.Config.Core.V3.Locality
  field :user_agent_name, 6, type: :string, json_name: "userAgentName"
  field :user_agent_version, 7, type: :string, json_name: "userAgentVersion", oneof: 0

  field :user_agent_build_version, 8,
    type: Envoy.Config.Core.V3.BuildVersion,
    json_name: "userAgentBuildVersion",
    oneof: 0

  field :extensions, 9, repeated: true, type: Envoy.Config.Core.V3.Extension
  field :client_features, 10, repeated: true, type: :string, json_name: "clientFeatures"

  field :listening_addresses, 11,
    repeated: true,
    type: Envoy.Config.Core.V3.Address,
    json_name: "listeningAddresses",
    deprecated: true
end

defmodule Envoy.Config.Core.V3.Metadata.FilterMetadataEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Struct
end

defmodule Envoy.Config.Core.V3.Metadata.TypedFilterMetadataEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Google.Protobuf.Any
end

defmodule Envoy.Config.Core.V3.Metadata do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :filter_metadata, 1,
    repeated: true,
    type: Envoy.Config.Core.V3.Metadata.FilterMetadataEntry,
    json_name: "filterMetadata",
    map: true

  field :typed_filter_metadata, 2,
    repeated: true,
    type: Envoy.Config.Core.V3.Metadata.TypedFilterMetadataEntry,
    json_name: "typedFilterMetadata",
    map: true
end

defmodule Envoy.Config.Core.V3.RuntimeUInt32 do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 2, type: :uint32, json_name: "defaultValue"
  field :runtime_key, 3, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Config.Core.V3.RuntimePercent do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 1, type: Envoy.Type.V3.Percent, json_name: "defaultValue"
  field :runtime_key, 2, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Config.Core.V3.RuntimeDouble do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 1, type: :double, json_name: "defaultValue"
  field :runtime_key, 2, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Config.Core.V3.RuntimeFeatureFlag do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 1,
    type: Google.Protobuf.BoolValue,
    json_name: "defaultValue",
    deprecated: false

  field :runtime_key, 2, type: :string, json_name: "runtimeKey", deprecated: false
end

defmodule Envoy.Config.Core.V3.QueryParameter do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string
end

defmodule Envoy.Config.Core.V3.HeaderValue do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string, deprecated: false
  field :value, 2, type: :string, deprecated: false
  field :raw_value, 3, type: :bytes, json_name: "rawValue", deprecated: false
end

defmodule Envoy.Config.Core.V3.HeaderValueOption do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header, 1, type: Envoy.Config.Core.V3.HeaderValue, deprecated: false
  field :append, 2, type: Google.Protobuf.BoolValue, deprecated: true

  field :append_action, 3,
    type: Envoy.Config.Core.V3.HeaderValueOption.HeaderAppendAction,
    json_name: "appendAction",
    enum: true,
    deprecated: false

  field :keep_empty_value, 4, type: :bool, json_name: "keepEmptyValue"
end

defmodule Envoy.Config.Core.V3.HeaderMap do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :headers, 1, repeated: true, type: Envoy.Config.Core.V3.HeaderValue
end

defmodule Envoy.Config.Core.V3.WatchedDirectory do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :path, 1, type: :string, deprecated: false
end

defmodule Envoy.Config.Core.V3.DataSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :specifier, 0

  field :filename, 1, type: :string, oneof: 0, deprecated: false
  field :inline_bytes, 2, type: :bytes, json_name: "inlineBytes", oneof: 0
  field :inline_string, 3, type: :string, json_name: "inlineString", oneof: 0

  field :environment_variable, 4,
    type: :string,
    json_name: "environmentVariable",
    oneof: 0,
    deprecated: false
end

defmodule Envoy.Config.Core.V3.RetryPolicy do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :retry_back_off, 1, type: Envoy.Config.Core.V3.BackoffStrategy, json_name: "retryBackOff"

  field :num_retries, 2,
    type: Google.Protobuf.UInt32Value,
    json_name: "numRetries",
    deprecated: false
end

defmodule Envoy.Config.Core.V3.RemoteDataSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_uri, 1, type: Envoy.Config.Core.V3.HttpUri, json_name: "httpUri", deprecated: false
  field :sha256, 2, type: :string, deprecated: false
  field :retry_policy, 3, type: Envoy.Config.Core.V3.RetryPolicy, json_name: "retryPolicy"
end

defmodule Envoy.Config.Core.V3.AsyncDataSource do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :specifier, 0

  field :local, 1, type: Envoy.Config.Core.V3.DataSource, oneof: 0
  field :remote, 2, type: Envoy.Config.Core.V3.RemoteDataSource, oneof: 0
end

defmodule Envoy.Config.Core.V3.TransportSocket do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :config_type, 0

  field :name, 1, type: :string, deprecated: false
  field :typed_config, 3, type: Google.Protobuf.Any, json_name: "typedConfig", oneof: 0
end

defmodule Envoy.Config.Core.V3.RuntimeFractionalPercent do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :default_value, 1,
    type: Envoy.Type.V3.FractionalPercent,
    json_name: "defaultValue",
    deprecated: false

  field :runtime_key, 2, type: :string, json_name: "runtimeKey"
end

defmodule Envoy.Config.Core.V3.ControlPlane do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :identifier, 1, type: :string
end