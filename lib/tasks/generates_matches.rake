desc 'Updates the winning records of all the players'
task generate_matches: :environment do
  players = Player.all
  if players.count <= 1
    puts 'Only 1 player'
  elsif players.count == 2
    dates = [
      Time.new(2016, 06, 15, 13, 10, 00),
      Time.new(2016, 06, 16, 13, 10, 00),
      Time.new(2016, 06, 20, 13, 10, 00)
    ]
    for i in 0..2
      m = Match.create(
        player_1: players[0].id,
        player_2: players[1].id,
        time: dates[i]
      )
      m.games.create(player: players[0])
      m.games.create(player: players[1])
      m.save
    end
  elsif players.count <= 7
    dates = [
      Time.new(2016, 06, 15, 13, 10, 00),
      Time.new(2016, 06, 15, 13, 20, 00),
      Time.new(2016, 06, 16, 13, 10, 00),
      Time.new(2016, 06, 16, 13, 20, 00),
      Time.new(2016, 06, 20, 13, 10, 00),
      Time.new(2016, 06, 20, 13, 20, 00),
      Time.new(2016, 06, 21, 13, 10, 00),
      Time.new(2016, 06, 21, 13, 20, 00),
      Time.new(2016, 06, 22, 13, 10, 00),
      Time.new(2016, 06, 22, 13, 20, 00),
      Time.new(2016, 06, 23, 13, 10, 00),
      Time.new(2016, 06, 23, 13, 20, 00),
      Time.new(2016, 06, 27, 13, 10, 00),
      Time.new(2016, 06, 27, 13, 20, 00),
      Time.new(2016, 06, 28, 13, 10, 00),
      Time.new(2016, 06, 28, 13, 20, 00),
      Time.new(2016, 06, 29, 13, 10, 00),
      Time.new(2016, 06, 29, 13, 20, 00),
      Time.new(2016, 06, 30, 13, 10, 00),
      Time.new(2016, 06, 30, 13, 20, 00),
      Time.new(2016, 07, 04, 13, 10, 00),
      Time.new(2016, 07, 04, 13, 20, 00),
      Time.new(2016, 07, 05, 13, 10, 00),
      Time.new(2016, 07, 05, 13, 20, 00)
    ]
    x = 0
    limit = players.count - 1
    while x < limit do
      for i in x+1..limit
        m = Match.create(
          player_1: players[x].id,
          player_2: players[i].id,
          time: dates.delete_at(rand(dates.length))
        )
        m.games.create(player: players[x])
        m.games.create(player: players[i])
        m.save
      end
      x = x + 1
    end
  end
end
