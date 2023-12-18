%%%-------------------------------------------------------------------
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(lc56).


%% API
-export([merge/1]).
-spec merge(Intervals :: [[integer()]]) -> [[integer()]].
merge(Intervals) ->
  SortList = lists:sort(Intervals),
  do(tl(SortList), [hd(SortList)]).

do([], Acc) ->
  lists:reverse(Acc);
do([[H, T] | SortList], [[Head, Tail] | Acc]) when T =< Tail ->
  do(SortList, [[Head, Tail] | Acc]);
do([[H, T] | SortList], [[Head, Tail] | Acc]) when H =< Tail ->
  do(SortList, [[Head, T] | Acc]);
do([[H, T] | SortList], Acc) ->
  do(SortList, [[H, T] | Acc]).

