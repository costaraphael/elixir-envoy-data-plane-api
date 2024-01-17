defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DestinationIPInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DestinationPortInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourceIPInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourcePortInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.DirectSourceIPInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.SourceTypeInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.ServerNameInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.TransportProtocolInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.ApplicationProtocolInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Envoy.Extensions.Matching.CommonInputs.Network.V3.FilterStateInput do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string, deprecated: false
end