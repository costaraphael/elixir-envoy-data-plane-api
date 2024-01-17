defmodule Udpa.Annotations.FieldSecurityAnnotation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :configure_for_untrusted_downstream, 1,
    type: :bool,
    json_name: "configureForUntrustedDownstream"

  field :configure_for_untrusted_upstream, 2,
    type: :bool,
    json_name: "configureForUntrustedUpstream"
end