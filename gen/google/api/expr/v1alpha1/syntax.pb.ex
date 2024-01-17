defmodule Google.Api.Expr.V1alpha1.ParsedExpr do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :expr, 2, type: Google.Api.Expr.V1alpha1.Expr
  field :source_info, 3, type: Google.Api.Expr.V1alpha1.SourceInfo, json_name: "sourceInfo"
end

defmodule Google.Api.Expr.V1alpha1.Expr.Ident do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: :string
end

defmodule Google.Api.Expr.V1alpha1.Expr.Select do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :operand, 1, type: Google.Api.Expr.V1alpha1.Expr
  field :field, 2, type: :string
  field :test_only, 3, type: :bool, json_name: "testOnly"
end

defmodule Google.Api.Expr.V1alpha1.Expr.Call do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :target, 1, type: Google.Api.Expr.V1alpha1.Expr
  field :function, 2, type: :string
  field :args, 3, repeated: true, type: Google.Api.Expr.V1alpha1.Expr
end

defmodule Google.Api.Expr.V1alpha1.Expr.CreateList do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :elements, 1, repeated: true, type: Google.Api.Expr.V1alpha1.Expr
end

defmodule Google.Api.Expr.V1alpha1.Expr.CreateStruct.Entry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :key_kind, 0

  field :id, 1, type: :int64
  field :field_key, 2, type: :string, json_name: "fieldKey", oneof: 0
  field :map_key, 3, type: Google.Api.Expr.V1alpha1.Expr, json_name: "mapKey", oneof: 0
  field :value, 4, type: Google.Api.Expr.V1alpha1.Expr
end

defmodule Google.Api.Expr.V1alpha1.Expr.CreateStruct do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :message_name, 1, type: :string, json_name: "messageName"
  field :entries, 2, repeated: true, type: Google.Api.Expr.V1alpha1.Expr.CreateStruct.Entry
end

defmodule Google.Api.Expr.V1alpha1.Expr.Comprehension do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :iter_var, 1, type: :string, json_name: "iterVar"
  field :iter_range, 2, type: Google.Api.Expr.V1alpha1.Expr, json_name: "iterRange"
  field :accu_var, 3, type: :string, json_name: "accuVar"
  field :accu_init, 4, type: Google.Api.Expr.V1alpha1.Expr, json_name: "accuInit"
  field :loop_condition, 5, type: Google.Api.Expr.V1alpha1.Expr, json_name: "loopCondition"
  field :loop_step, 6, type: Google.Api.Expr.V1alpha1.Expr, json_name: "loopStep"
  field :result, 7, type: Google.Api.Expr.V1alpha1.Expr
end

defmodule Google.Api.Expr.V1alpha1.Expr do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :expr_kind, 0

  field :id, 2, type: :int64
  field :const_expr, 3, type: Google.Api.Expr.V1alpha1.Constant, json_name: "constExpr", oneof: 0

  field :ident_expr, 4,
    type: Google.Api.Expr.V1alpha1.Expr.Ident,
    json_name: "identExpr",
    oneof: 0

  field :select_expr, 5,
    type: Google.Api.Expr.V1alpha1.Expr.Select,
    json_name: "selectExpr",
    oneof: 0

  field :call_expr, 6, type: Google.Api.Expr.V1alpha1.Expr.Call, json_name: "callExpr", oneof: 0

  field :list_expr, 7,
    type: Google.Api.Expr.V1alpha1.Expr.CreateList,
    json_name: "listExpr",
    oneof: 0

  field :struct_expr, 8,
    type: Google.Api.Expr.V1alpha1.Expr.CreateStruct,
    json_name: "structExpr",
    oneof: 0

  field :comprehension_expr, 9,
    type: Google.Api.Expr.V1alpha1.Expr.Comprehension,
    json_name: "comprehensionExpr",
    oneof: 0
end

defmodule Google.Api.Expr.V1alpha1.Constant do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :constant_kind, 0

  field :null_value, 1,
    type: Google.Protobuf.NullValue,
    json_name: "nullValue",
    enum: true,
    oneof: 0

  field :bool_value, 2, type: :bool, json_name: "boolValue", oneof: 0
  field :int64_value, 3, type: :int64, json_name: "int64Value", oneof: 0
  field :uint64_value, 4, type: :uint64, json_name: "uint64Value", oneof: 0
  field :double_value, 5, type: :double, json_name: "doubleValue", oneof: 0
  field :string_value, 6, type: :string, json_name: "stringValue", oneof: 0
  field :bytes_value, 7, type: :bytes, json_name: "bytesValue", oneof: 0

  field :duration_value, 8,
    type: Google.Protobuf.Duration,
    json_name: "durationValue",
    oneof: 0,
    deprecated: true

  field :timestamp_value, 9,
    type: Google.Protobuf.Timestamp,
    json_name: "timestampValue",
    oneof: 0,
    deprecated: true
end

defmodule Google.Api.Expr.V1alpha1.SourceInfo.PositionsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :int64
  field :value, 2, type: :int32
end

defmodule Google.Api.Expr.V1alpha1.SourceInfo.MacroCallsEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :int64
  field :value, 2, type: Google.Api.Expr.V1alpha1.Expr
end

defmodule Google.Api.Expr.V1alpha1.SourceInfo do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :syntax_version, 1, type: :string, json_name: "syntaxVersion"
  field :location, 2, type: :string
  field :line_offsets, 3, repeated: true, type: :int32, json_name: "lineOffsets"

  field :positions, 4,
    repeated: true,
    type: Google.Api.Expr.V1alpha1.SourceInfo.PositionsEntry,
    map: true

  field :macro_calls, 5,
    repeated: true,
    type: Google.Api.Expr.V1alpha1.SourceInfo.MacroCallsEntry,
    json_name: "macroCalls",
    map: true
end

defmodule Google.Api.Expr.V1alpha1.SourcePosition do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :location, 1, type: :string
  field :offset, 2, type: :int32
  field :line, 3, type: :int32
  field :column, 4, type: :int32
end