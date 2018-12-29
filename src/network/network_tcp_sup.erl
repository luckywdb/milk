%%%-------------------------------------------------------------------
%%% @author gebilaowhang
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 25. 十二月 2018 17:41
%%%-------------------------------------------------------------------
-module(network_tcp_sup).
-author("gebilaowhang").

-behaviour(supervisor).

-include("../include/server.hrl").

%% API
-export([start_link/0, start/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).
%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @end
%%--------------------------------------------------------------------
start() ->
    supervisor:start_child(?MAIN_PROCESS, ?SUPERVISOR(?MODULE, start_link, [])),
    supervisor:start_child(?SERVER, ?WORKER(network_tcp, start_link, [])).

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link() ->
    {ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).
%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
    {ok, {SupFlags :: {RestartStrategy :: supervisor:strategy(),
                       MaxR :: non_neg_integer(), MaxT :: non_neg_integer()},
          [ChildSpec :: supervisor:child_spec()]
    }} |
    ignore |
    {error, Reason :: term()}).
init([]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 1000,
    MaxSecondsBetweenRestarts = 3600,

    SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

%%    Restart = permanent,
%%    Shutdown = 2000,
%%    Type = worker,

%%    AChild = {network_tcp, {network_tcp, start_link, []},
%%              Restart, Shutdown, Type, [network_tcp]},

    {ok, {SupFlags, []}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
