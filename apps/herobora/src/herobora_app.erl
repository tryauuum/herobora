%%%-------------------------------------------------------------------
%% @doc herobora public API
%% @end
%%%-------------------------------------------------------------------

-module(herobora_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
  Dispatch = cowboy_router:compile([
    { <<"localhost">>, [{<<"/">>, hello_handler, []}] }
  ]),
  {ok, _} = cowboy:start_clear(
    hello_listener,
    [{port, 8080}],
    #{env => #{dispatch => Dispatch}}
  ),
  herobora_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
