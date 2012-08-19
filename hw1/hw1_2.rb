
# a
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
def rps_game_winner(game)
raise WrongNumberOfPlayersError unless game.length == 2
raise NoSuchStrategyError unless (game.collect {|x, y| y } | ["P", "R", "S"]).length == 3
strat = game.collect {|x, y| y }
 if game[0][1].eql? game[1][1]
    return game[0]
  elsif (strat | ["P", "R"]).length == 2
    return game.rassoc("P")
  elsif (strat | ["P", "S"]).length == 2
    return game.rassoc("S")
  elsif (strat | ["R", "S"]).length == 2
    return game.rassoc("R")
  end
end

# b
def rps_tournament_winner(game)
  if game[0][0].kind_of?(Array)
    return rps_game_winner([rps_tournament_winner(game[0]), rps_tournament_winner(game[1])])
  else
    return rps_game_winner([game[0], game[1]])
  end
end
