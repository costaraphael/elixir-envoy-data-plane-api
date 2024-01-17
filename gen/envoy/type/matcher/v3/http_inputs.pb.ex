defmodule Envoy.Type.Matcher.V3.HttpRequestHeaderMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpRequestTrailerMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpResponseHeaderMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpResponseTrailerMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false
end

defmodule Envoy.Type.Matcher.V3.HttpRequestQueryParamMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :query_param, 1, type: :string, json_name: "queryParam", deprecated: false
end