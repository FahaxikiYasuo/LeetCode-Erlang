%%%-------------------------------------------------------------------
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(lc162).
%% 因为二分查找，需要获取的Len长度, 故不如直接查找
-export([find_peak_element/1]).
-spec find_peak_element(Nums :: [integer()]) -> integer().
find_peak_element(Nums) ->
  do(Nums, 0).

do([_], Idx) ->
  Idx;
do([A, B | _Nums], Idx)
  when A > B ->
  Idx;
do([_A | Nums], Idx) ->
  do(Nums, Idx + 1).
