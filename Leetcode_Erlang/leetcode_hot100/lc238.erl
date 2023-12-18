%%%-------------------------------------------------------------------
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(lc238).
-author("Administrator").

%% API
-export([]).
-spec product_except_self(Nums :: [integer()]) -> [integer()].
product_except_self(Nums) ->
  SumMul = do(Nums, 1),
  [ SumMul div  Num || Num <- Nums].

do([], Acc) -> Acc;
do([H | Nums], Acc) ->
  do(Nums, H * Acc).