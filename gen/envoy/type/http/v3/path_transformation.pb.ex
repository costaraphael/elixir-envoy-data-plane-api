defmodule Envoy.Type.Http.V3.PathTransformation.Operation.NormalizePathRFC3986 do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Type.Http.V3.PathTransformation.Operation.MergeSlashes do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Type.Http.V3.PathTransformation.Operation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :operation_specifier, 0

  field :normalize_path_rfc_3986, 2,
    type: Envoy.Type.Http.V3.PathTransformation.Operation.NormalizePathRFC3986,
    json_name: "normalizePathRfc3986",
    oneof: 0

  field :merge_slashes, 3,
    type: Envoy.Type.Http.V3.PathTransformation.Operation.MergeSlashes,
    json_name: "mergeSlashes",
    oneof: 0
end

defmodule Envoy.Type.Http.V3.PathTransformation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :operations, 1, repeated: true, type: Envoy.Type.Http.V3.PathTransformation.Operation
end