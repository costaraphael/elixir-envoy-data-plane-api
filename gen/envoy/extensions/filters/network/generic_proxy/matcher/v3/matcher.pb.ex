defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.ServiceMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.HostMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.PathMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.MethodMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.PropertyMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :property_name, 1, type: :string, json_name: "propertyName", deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.RequestMatchInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.KeyValueMatchEntry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false

  field :string_match, 2,
    type: Envoy.Type.Matcher.V3.StringMatcher,
    json_name: "stringMatch",
    deprecated: false
end

defmodule Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.RequestMatcher do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :host, 1, type: Envoy.Type.Matcher.V3.StringMatcher
  field :path, 2, type: Envoy.Type.Matcher.V3.StringMatcher
  field :method, 3, type: Envoy.Type.Matcher.V3.StringMatcher

  field :properties, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Network.GenericProxy.Matcher.V3.KeyValueMatchEntry
end