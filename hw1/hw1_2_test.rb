
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


#---- TEST start ----
require "pp"

igra = [ [ "Armando", "P" ], [ "Dave", "S" ] ]
pp rps_game_winner(igra)
# => returns the list ["Dave", "S"] wins since S>P

igra1 = [ [ "Armando", "P" ], [ "Dave", "S" ], [ "Milos", "R" ] ]
#pp rps_game_winner(igra1)
# WrongNumberOfPlayersError

igra2 = [ [ "Armando", "X" ], [ "Dave", "S" ] ]
#pp rps_game_winner(igra2)
# NoSuchStrategyError

igra3 = [ [ "Milos", "P" ], [ "Dave", "P" ] ]
pp rps_game_winner(igra3)

puts '------------ b ------------'

igra_b = [
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]

pp rps_tournament_winner(igra_b)

igra_b1 = [
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard Milos", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
],
[
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"], ["Michael", "S"] ],
],
[
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]

pp rps_tournament_winner(igra_b1)


# Generate a random Rock-Papers-Scissors tournament with (2**levels) players.
# The players are numbered consecutively, with the first number being (start).

def random_tournament(levels, start)
    # A zero-level tournament consists of a player name and a strategy.
    if levels == 0
        player_name = "Player " + start.to_s()
        player_strategy = ["R","S","P"][rand(3)]
        return [player_name, player_strategy]
    else
        # An n-level tournament (n>0) is a pair of (n-1)-level tournaments.
        subtournament_1 = random_tournament(levels-1,start)
        subtournament_2 = random_tournament(levels-1,start+2**(levels-1))
        return [subtournament_1, subtournament_2]
    end
end

# Generate a tournament with 16 players.
#puts random_tournament(4, 1)