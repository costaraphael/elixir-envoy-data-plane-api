defmodule Opencensus.Proto.Trace.V1.Span.SpanKind do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :SPAN_KIND_UNSPECIFIED, 0
  field :SERVER, 1
  field :CLIENT, 2
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent.Type do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :TYPE_UNSPECIFIED, 0
  field :SENT, 1
  field :RECEIVED, 2
end

defmodule Opencensus.Proto.Trace.V1.Span.Link.Type do
  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :TYPE_UNSPECIFIED, 0
  field :CHILD_LINKED_SPAN, 1
  field :PARENT_LINKED_SPAN, 2
end

defmodule Opencensus.Proto.Trace.V1.Span.Tracestate.Entry do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Opencensus.Proto.Trace.V1.Span.Tracestate do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :entries, 1, repeated: true, type: Opencensus.Proto.Trace.V1.Span.Tracestate.Entry
end

defmodule Opencensus.Proto.Trace.V1.Span.Attributes.AttributeMapEntry do
  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: Opencensus.Proto.Trace.V1.AttributeValue
end

defmodule Opencensus.Proto.Trace.V1.Span.Attributes do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attribute_map, 1,
    repeated: true,
    type: Opencensus.Proto.Trace.V1.Span.Attributes.AttributeMapEntry,
    json_name: "attributeMap",
    map: true

  field :dropped_attributes_count, 2, type: :int32, json_name: "droppedAttributesCount"
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.Annotation do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :description, 1, type: Opencensus.Proto.Trace.V1.TruncatableString
  field :attributes, 2, type: Opencensus.Proto.Trace.V1.Span.Attributes
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :type, 1, type: Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent.Type, enum: true
  field :id, 2, type: :uint64
  field :uncompressed_size, 3, type: :uint64, json_name: "uncompressedSize"
  field :compressed_size, 4, type: :uint64, json_name: "compressedSize"
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvent do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :time, 1, type: Google.Protobuf.Timestamp
  field :annotation, 2, type: Opencensus.Proto.Trace.V1.Span.TimeEvent.Annotation, oneof: 0

  field :message_event, 3,
    type: Opencensus.Proto.Trace.V1.Span.TimeEvent.MessageEvent,
    json_name: "messageEvent",
    oneof: 0
end

defmodule Opencensus.Proto.Trace.V1.Span.TimeEvents do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :time_event, 1,
    repeated: true,
    type: Opencensus.Proto.Trace.V1.Span.TimeEvent,
    json_name: "timeEvent"

  field :dropped_annotations_count, 2, type: :int32, json_name: "droppedAnnotationsCount"
  field :dropped_message_events_count, 3, type: :int32, json_name: "droppedMessageEventsCount"
end

defmodule Opencensus.Proto.Trace.V1.Span.Link do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :trace_id, 1, type: :bytes, json_name: "traceId"
  field :span_id, 2, type: :bytes, json_name: "spanId"
  field :type, 3, type: Opencensus.Proto.Trace.V1.Span.Link.Type, enum: true
  field :attributes, 4, type: Opencensus.Proto.Trace.V1.Span.Attributes
  field :tracestate, 5, type: Opencensus.Proto.Trace.V1.Span.Tracestate
end

defmodule Opencensus.Proto.Trace.V1.Span.Links do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :link, 1, repeated: true, type: Opencensus.Proto.Trace.V1.Span.Link
  field :dropped_links_count, 2, type: :int32, json_name: "droppedLinksCount"
end

defmodule Opencensus.Proto.Trace.V1.Span do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :trace_id, 1, type: :bytes, json_name: "traceId"
  field :span_id, 2, type: :bytes, json_name: "spanId"
  field :tracestate, 15, type: Opencensus.Proto.Trace.V1.Span.Tracestate
  field :parent_span_id, 3, type: :bytes, json_name: "parentSpanId"
  field :name, 4, type: Opencensus.Proto.Trace.V1.TruncatableString
  field :kind, 14, type: Opencensus.Proto.Trace.V1.Span.SpanKind, enum: true
  field :start_time, 5, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :end_time, 6, type: Google.Protobuf.Timestamp, json_name: "endTime"
  field :attributes, 7, type: Opencensus.Proto.Trace.V1.Span.Attributes
  field :stack_trace, 8, type: Opencensus.Proto.Trace.V1.StackTrace, json_name: "stackTrace"
  field :time_events, 9, type: Opencensus.Proto.Trace.V1.Span.TimeEvents, json_name: "timeEvents"
  field :links, 10, type: Opencensus.Proto.Trace.V1.Span.Links
  field :status, 11, type: Opencensus.Proto.Trace.V1.Status
  field :resource, 16, type: Opencensus.Proto.Resource.V1.Resource

  field :same_process_as_parent_span, 12,
    type: Google.Protobuf.BoolValue,
    json_name: "sameProcessAsParentSpan"

  field :child_span_count, 13, type: Google.Protobuf.UInt32Value, json_name: "childSpanCount"
end

defmodule Opencensus.Proto.Trace.V1.Status do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :code, 1, type: :int32
  field :message, 2, type: :string
end

defmodule Opencensus.Proto.Trace.V1.AttributeValue do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :value, 0

  field :string_value, 1,
    type: Opencensus.Proto.Trace.V1.TruncatableString,
    json_name: "stringValue",
    oneof: 0

  field :int_value, 2, type: :int64, json_name: "intValue", oneof: 0
  field :bool_value, 3, type: :bool, json_name: "boolValue", oneof: 0
  field :double_value, 4, type: :double, json_name: "doubleValue", oneof: 0
end

defmodule Opencensus.Proto.Trace.V1.StackTrace.StackFrame do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :function_name, 1,
    type: Opencensus.Proto.Trace.V1.TruncatableString,
    json_name: "functionName"

  field :original_function_name, 2,
    type: Opencensus.Proto.Trace.V1.TruncatableString,
    json_name: "originalFunctionName"

  field :file_name, 3, type: Opencensus.Proto.Trace.V1.TruncatableString, json_name: "fileName"
  field :line_number, 4, type: :int64, json_name: "lineNumber"
  field :column_number, 5, type: :int64, json_name: "columnNumber"
  field :load_module, 6, type: Opencensus.Proto.Trace.V1.Module, json_name: "loadModule"

  field :source_version, 7,
    type: Opencensus.Proto.Trace.V1.TruncatableString,
    json_name: "sourceVersion"
end

defmodule Opencensus.Proto.Trace.V1.StackTrace.StackFrames do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :frame, 1, repeated: true, type: Opencensus.Proto.Trace.V1.StackTrace.StackFrame
  field :dropped_frames_count, 2, type: :int32, json_name: "droppedFramesCount"
end

defmodule Opencensus.Proto.Trace.V1.StackTrace do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :stack_frames, 1,
    type: Opencensus.Proto.Trace.V1.StackTrace.StackFrames,
    json_name: "stackFrames"

  field :stack_trace_hash_id, 2, type: :uint64, json_name: "stackTraceHashId"
end

defmodule Opencensus.Proto.Trace.V1.Module do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :module, 1, type: Opencensus.Proto.Trace.V1.TruncatableString
  field :build_id, 2, type: Opencensus.Proto.Trace.V1.TruncatableString, json_name: "buildId"
end

defmodule Opencensus.Proto.Trace.V1.TruncatableString do
  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :value, 1, type: :string
  field :truncated_byte_count, 2, type: :int32, json_name: "truncatedByteCount"
end