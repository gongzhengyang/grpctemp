%%%-------------------------------------------------------------------
%% @doc grpctemp top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(grpctemp_sup).
-include_lib("kernel/include/logger.hrl").
-behaviour(supervisor).
-define(MANDATORY_GRPC_SERVICES, [echo]).

-export([start_link/0, client/0, for/2,send/1]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    % grpcbox:start(),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% sup_flags() = #{strategy => strategy(),         % optional
%%                 intensity => non_neg_integer(), % optional
%%                 period => pos_integer()}        % optional
%% child_spec() = #{id => child_id(),       % mandatory
%%                  start => mfargs(),      % mandatory
%%                  restart => restart(),   % optional
%%                  shutdown => shutdown(), % optional
%%                  type => worker(),       % optional
%%                  modules => modules()}   % optional
init([]) ->
    SupFlags = #{strategy => one_for_all,
                 intensity => 0,
                 period => 1},
    ChildSpecs = [],
    {ok, {SupFlags, ChildSpecs}}.

%% internal functions

client() -> 
    io:format("__---------____"),
    application:set_env(grpcbox, client, #{channel => []}),
    application:ensure_all_started(grpcbox),
    timer:sleep(1000),
    grpcbox_channel_sup:start_link(),
    grpcbox_channel_sup:start_child(default_channel, [{http, "127.0.0.1", 50051, []}], #{}).

for(0, _) -> [];
for(N, S) when N > 0 -> 
    io:fwrite("-----~p ~n", [N]),
    timer:sleep(10),
    ok = grpcbox_client:send(S, #{message => "hello"}),
    for(N - 1, S).

send(N) -> 
    {ok, S} = grpc_examples_echo_echo_client:bidirectional_streaming_echo(),
    for(N, S).
