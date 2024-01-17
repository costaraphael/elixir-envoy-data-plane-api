defmodule Envoy.Extensions.Http.OriginalIpDetection.CustomHeader.V3.CustomHeaderConfig do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :header_name, 1, type: :string, json_name: "headerName", deprecated: false

  field :allow_extension_to_set_address_as_trusted, 2,
    type: :bool,
    json_name: "allowExtensionToSetAddressAsTrusted"

  field :reject_with_status, 3, type: Envoy.Type.V3.HttpStatus, json_name: "rejectWithStatus"
end