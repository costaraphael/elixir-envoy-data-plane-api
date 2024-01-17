defmodule Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.RequestType do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :BOTH, 0
  field :INTERNAL, 1
  field :EXTERNAL, 2
end

defmodule Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.IPTag do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ip_tag_name, 1, type: :string, json_name: "ipTagName"
  field :ip_list, 2, repeated: true, type: Envoy.Config.Core.V3.CidrRange, json_name: "ipList"
end

defmodule Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_type, 1,
    type: Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.RequestType,
    json_name: "requestType",
    enum: true,
    deprecated: false

  field :ip_tags, 4,
    repeated: true,
    type: Envoy.Extensions.Filters.Http.IpTagging.V3.IPTagging.IPTag,
    json_name: "ipTags",
    deprecated: false
end