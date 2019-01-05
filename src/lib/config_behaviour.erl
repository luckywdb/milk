-module(config_behaviour).
%%%=======================STATEMENT====================
-description("config_behaviour").
-copyright('youkia,www.youkia.net').
-author("wdb,wangdaobin@youkia.net").
-vsn(1).
%%%=======================EXPORT=======================
%%%=======================INCLUDE======================
%%%=======================RECORD=======================
%%%=======================DEFINE=======================
%%%=================EXPORTED FUNCTIONS=================
%% ----------------------------------------------------
%% Func: 
%% Description: 
%% Returns: 
%% ----------------------------------------------------

-callback handle_config(any(), any()) -> any(). %% 处理配置文件内容
-callback get(TableName :: term(), Key :: any()) -> any().  %% 获取一条数据
-callback get(TableName :: term()) -> list(). % 获取表中所有数据
%%%===================LOCAL FUNCTIONS==================
%% ----------------------------------------------------
%% Func: 
%% Description: 
%% Returns: 
%% ----------------------------------------------------
