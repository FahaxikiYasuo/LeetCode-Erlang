-module(lc2225).


%% API
-export([find_winners/1]).

-spec find_winners(Matches :: [[integer()]]) -> [[integer()]].
find_winners(Matches) ->
    {WinSet, LoseMap} = lists:foldl(
        fun([Win, Lose], {Sets, LoseMao}) ->
            {maps:put(Win, 1, Sets),
                maps:put(Lose, maps:get(Lose, LoseMao, 0) + 1, LoseMao)
            }
        end, {maps:new(), #{}}, Matches),
    Ans2 = [Id || {Id, 1} <- maps:to_list(LoseMap)],
    Ans1 = [Id || {Id, _} <- maps:to_list(WinSet), not maps:is_key(Id, LoseMap)],

    [lists:sort(Ans1), lists:sort(Ans2)].
