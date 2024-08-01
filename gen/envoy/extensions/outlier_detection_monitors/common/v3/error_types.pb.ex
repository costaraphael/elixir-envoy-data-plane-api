defmodule Envoy.Extensions.OutlierDetectionMonitors.Common.V3.HttpErrors do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :range, 1, type: Envoy.Type.V3.Int32Range
end

defmodule Envoy.Extensions.OutlierDetectionMonitors.Common.V3.LocalOriginErrors do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.OutlierDetectionMonitors.Common.V3.DatabaseErrors do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.OutlierDetectionMonitors.Common.V3.ErrorBuckets do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :http_errors, 1,
    repeated: true,
    type: Envoy.Extensions.OutlierDetectionMonitors.Common.V3.HttpErrors,
    json_name: "httpErrors"

  field :local_origin_errors, 2,
    repeated: true,
    type: Envoy.Extensions.OutlierDetectionMonitors.Common.V3.LocalOriginErrors,
    json_name: "localOriginErrors"

  field :database_errors, 3,
    repeated: true,
    type: Envoy.Extensions.OutlierDetectionMonitors.Common.V3.DatabaseErrors,
    json_name: "databaseErrors"
end