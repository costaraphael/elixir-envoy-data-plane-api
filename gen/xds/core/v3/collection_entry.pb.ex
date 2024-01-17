defmodule Xds.Core.V3.CollectionEntry.InlineEntry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string, deprecated: false
  field :version, 2, type: :string
  field :resource, 3, type: Google.Protobuf.Any
end

defmodule Xds.Core.V3.CollectionEntry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :resource_specifier, 0

  field :locator, 1, type: Xds.Core.V3.ResourceLocator, oneof: 0

  field :inline_entry, 2,
    type: Xds.Core.V3.CollectionEntry.InlineEntry,
    json_name: "inlineEntry",
    oneof: 0
end