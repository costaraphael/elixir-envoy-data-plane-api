defmodule Xds.Core.V3.ResourceLocator.Scheme do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :XDSTP, 0
  field :HTTP, 1
  field :FILE, 2
end

defmodule Xds.Core.V3.ResourceLocator.Directive do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :directive, 0

  field :alt, 1, type: Xds.Core.V3.ResourceLocator, oneof: 0
  field :entry, 2, type: :string, oneof: 0, deprecated: false
end

defmodule Xds.Core.V3.ResourceLocator do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :context_param_specifier, 0

  field :scheme, 1, type: Xds.Core.V3.ResourceLocator.Scheme, enum: true, deprecated: false
  field :id, 2, type: :string
  field :authority, 3, type: :string
  field :resource_type, 4, type: :string, json_name: "resourceType", deprecated: false
  field :exact_context, 5, type: Xds.Core.V3.ContextParams, json_name: "exactContext", oneof: 0
  field :directives, 6, repeated: true, type: Xds.Core.V3.ResourceLocator.Directive
end