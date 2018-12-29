-module(file_lib).
%%%=======================STATEMENT====================
-description("file_lib").
-copyright('youkia,www.youkia.net').
-author("wdb,wangdaobin@youkia.net").
-vsn(1).
%%%=======================EXPORT=======================
-export([list_files/1, get_file_last_write_time/1, get_file_info/1]).

%%%=======================INCLUDE======================
-include_lib("kernel/include/file.hrl").
%%%=======================RECORD=======================
%%%=======================DEFINE=======================
%%%=================EXPORTED FUNCTIONS=================
%% ----------------------------------------------------
%% Func: list_files/1
%% Description: 获取目录下的所有文件
%% Returns: 
%% ----------------------------------------------------
list_files(Dir) ->
    case file:list_dir(Dir) of
        {ok, Files} ->
            Files;
        {error, Reason} ->
            Reason
    end.

%% ----------------------------------------------------
%% Func: get_file/1
%% Description: 获取文件最后更改时间
%% Returns:
%% ----------------------------------------------------
get_file_info(FileDir) ->
    case file:read_file_info(FileDir) of
        {ok, FileInfo} ->
            FileInfo;
        {error, Reason} ->
            Reason
    end.

%% ----------------------------------------------------
%% Func: get_file_last_write_time/1
%% Description: 获取文件最后更改时间
%% Returns:
%% ----------------------------------------------------
get_file_last_write_time(#file_info{mtime = MTime}) ->
    MTime;
get_file_last_write_time(FileDir) ->
    case get_file_info(FileDir) of
        #file_info{mtime = MTime} ->
            MTime;
        Reason ->
            Reason
    end.


%%%===================LOCAL FUNCTIONS==================
%% ----------------------------------------------------
%% Func: 
%% Description: 
%% Returns: 
%% ----------------------------------------------------
