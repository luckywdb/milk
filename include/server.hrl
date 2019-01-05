%%%-------------------------------------------------------------------
%%% @author gebilaowhang
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 十二月 2018 9:59
%%%-------------------------------------------------------------------
-author("gebilaowhang").

-define(MAIN_PROCESS, milk_sup).        %% 主进程名称
-define(SUPERVISOR(M, F, A), {M, {M, F, A}, transient, brutal_kill, supervisor, [M]}).      %% 监督子进程模板
-define(WORKER(M, F, A), {M, {M, F, A}, transient, brutal_kill, worker, [M]}).              %% 工作子进程模板

-define(ETS_OPTION(KeyPosition), [set, named_table, public, {keypos, KeyPosition}]).