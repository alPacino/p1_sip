%%%-------------------------------------------------------------------
%%% File    : esip_tmp_sup.erl
%%% Author  : Evgeniy Khramtsov <ekhramtsov@process-one.net>
%%% Description : A pattern for simple_one_for_one supervisor
%%%
%%% Created : 15 Jul 2009 by Evgeniy Khramtsov <ekhramtsov@process-one.net>
%%%-------------------------------------------------------------------
-module(esip_tmp_sup).

%% API
-export([start_link/2, init/1]).

%%====================================================================
%% API
%%====================================================================
start_link(Name, Module) ->
    supervisor:start_link({local, Name}, ?MODULE, Module).


init(Module) ->
    {ok, {{simple_one_for_one, 10, 1},
	  [{undefined, {Module, start_link, []},
	    temporary, brutal_kill, worker, [Module]}]}}.

%%====================================================================
%% Internal functions
%%====================================================================
