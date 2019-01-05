-module(milk_config).
%%%=======================STATEMENT====================
-description("milk_config").
-copyright('youkia,www.youkia.net').
-author("wdb,wangdaobin@youkia.net").
-vsn(1).
%%%=======================EXPORT=======================
-behaviour(config_behaviour).

-export([handle_config/2, get/2, get/1]).

%%%=======================INCLUDE======================
-include("../include/server.hrl").

%%%=======================RECORD=======================
%%%=======================DEFINE=======================
%%%=================EXPORTED FUNCTIONS=================
%% ----------------------------------------------------
%% Func: handle_config/2
%% Description: 配置的内容处理
%% Returns: 
%% ----------------------------------------------------
handle_config({TableName, DataList}, KeyPosition) ->
    case ets:info(TableName) of
        undefined ->    %5没有表, 新建
            ets:new(TableName, ?ETS_OPTION(KeyPosition));
        _ ->    %% 有表, 清除所有数据
            ets:delete_all_objects(TableName)%% 先清除这张ets表
    end,
    ets:insert(TableName, DataList).

%% ----------------------------------------------------
%% Func: handle_config/2
%% Description: 配置的内容处理
%% Returns:
%% ----------------------------------------------------
get(TableName, Key) ->
    case ets:lookup(TableName, Key) of
        [Value] ->
            Value;
        _ ->
            undefiend
    end.

%% ----------------------------------------------------
%% Func: get/2
%% Description: 获取所有数据
%% Returns:
%% ----------------------------------------------------
get(TableName) ->
    ets:tab2list(TableName).

%%%===================LOCAL FUNCTIONS==================
%% ----------------------------------------------------
%% Func: 
%% Description: 
%% Returns: 
%% ----------------------------------------------------
