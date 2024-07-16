%%%-------------------------------------------------------------------
%% @doc Client module for grpc service grpc.examples.echo.Echo.
%% @end
%%%-------------------------------------------------------------------

%% this module was generated and should not be modified manually

-module(grpc_examples_echo_echo_client).

-compile(export_all).
-compile(nowarn_export_all).

-include_lib("grpcbox/include/grpcbox.hrl").

-define(is_ctx(Ctx), is_tuple(Ctx) andalso element(1, Ctx) =:= ctx).

-define(SERVICE, 'grpc.examples.echo.Echo').
-define(PROTO_MODULE, 'echo_pb').
-define(MARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:encode_msg(I, T) end).
-define(UNMARSHAL_FUN(T), fun(I) -> ?PROTO_MODULE:decode_msg(I, T) end).
-define(DEF(Input, Output, MessageType), #grpcbox_def{service=?SERVICE,
                                                      message_type=MessageType,
                                                      marshal_fun=?MARSHAL_FUN(Input),
                                                      unmarshal_fun=?UNMARSHAL_FUN(Output)}).

%% @doc Unary RPC
-spec unary_echo(echo_pb:echo_request()) ->
    {ok, echo_pb:echo_response(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response() | {error, any()}.
unary_echo(Input) ->
    unary_echo(ctx:new(), Input, #{}).

-spec unary_echo(ctx:t() | echo_pb:echo_request(), echo_pb:echo_request() | grpcbox_client:options()) ->
    {ok, echo_pb:echo_response(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response() | {error, any()}.
unary_echo(Ctx, Input) when ?is_ctx(Ctx) ->
    unary_echo(Ctx, Input, #{});
unary_echo(Input, Options) ->
    unary_echo(ctx:new(), Input, Options).

-spec unary_echo(ctx:t(), echo_pb:echo_request(), grpcbox_client:options()) ->
    {ok, echo_pb:echo_response(), grpcbox:metadata()} | grpcbox_stream:grpc_error_response() | {error, any()}.
unary_echo(Ctx, Input, Options) ->
    grpcbox_client:unary(Ctx, <<"/grpc.examples.echo.Echo/UnaryEcho">>, Input, ?DEF(echo_request, echo_response, <<"grpc.examples.echo.EchoRequest">>), Options).

%% @doc 
-spec server_streaming_echo(echo_pb:echo_request()) ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
server_streaming_echo(Input) ->
    server_streaming_echo(ctx:new(), Input, #{}).

-spec server_streaming_echo(ctx:t() | echo_pb:echo_request(), echo_pb:echo_request() | grpcbox_client:options()) ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
server_streaming_echo(Ctx, Input) when ?is_ctx(Ctx) ->
    server_streaming_echo(Ctx, Input, #{});
server_streaming_echo(Input, Options) ->
    server_streaming_echo(ctx:new(), Input, Options).

-spec server_streaming_echo(ctx:t(), echo_pb:echo_request(), grpcbox_client:options()) ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
server_streaming_echo(Ctx, Input, Options) ->
    grpcbox_client:stream(Ctx, <<"/grpc.examples.echo.Echo/ServerStreamingEcho">>, Input, ?DEF(echo_request, echo_response, <<"grpc.examples.echo.EchoRequest">>), Options).

%% @doc 
-spec client_streaming_echo() ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
client_streaming_echo() ->
    client_streaming_echo(ctx:new(), #{}).

-spec client_streaming_echo(ctx:t() | grpcbox_client:options()) ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
client_streaming_echo(Ctx) when ?is_ctx(Ctx) ->
    client_streaming_echo(Ctx, #{});
client_streaming_echo(Options) ->
    client_streaming_echo(ctx:new(), Options).

-spec client_streaming_echo(ctx:t(), grpcbox_client:options()) ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
client_streaming_echo(Ctx, Options) ->
    grpcbox_client:stream(Ctx, <<"/grpc.examples.echo.Echo/ClientStreamingEcho">>, ?DEF(echo_request, echo_response, <<"grpc.examples.echo.EchoRequest">>), Options).

%% @doc 
-spec bidirectional_streaming_echo() ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
bidirectional_streaming_echo() ->
    bidirectional_streaming_echo(ctx:new(), #{}).

-spec bidirectional_streaming_echo(ctx:t() | grpcbox_client:options()) ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
bidirectional_streaming_echo(Ctx) when ?is_ctx(Ctx) ->
    bidirectional_streaming_echo(Ctx, #{});
bidirectional_streaming_echo(Options) ->
    bidirectional_streaming_echo(ctx:new(), Options).

-spec bidirectional_streaming_echo(ctx:t(), grpcbox_client:options()) ->
    {ok, grpcbox_client:stream()} | grpcbox_stream:grpc_error_response() | {error, any()}.
bidirectional_streaming_echo(Ctx, Options) ->
    grpcbox_client:stream(Ctx, <<"/grpc.examples.echo.Echo/BidirectionalStreamingEcho">>, ?DEF(echo_request, echo_response, <<"grpc.examples.echo.EchoRequest">>), Options).

