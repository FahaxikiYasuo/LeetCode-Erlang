%%%-------------------------------------------------------------------
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(lc238).
-author("Administrator").

%% API
-export([test/0]).
test() ->
  product_except_self([1, 2, 3, 4]).

-spec product_except_self(Nums :: [integer()]) -> [integer()].
product_except_self(Nums) ->
  T1 = get_trig(Nums, [1]),
  T2 = get_trig(lists:reverse(Nums), [1]),
  do(T1, lists:reverse(T2), []).

do([], [], Acc) ->
  Acc;
do([H1 | T1], [H2 | T2], Acc) ->
  do(T1, T2, [H1 * H2 | Acc]).

get_trig([_], Acc) ->
  Acc;
get_trig([Num | Nums], [A | Acc]) ->
  get_trig(Nums, [Num * A, A | Acc]).


