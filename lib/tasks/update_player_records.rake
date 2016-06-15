desc 'Updates the winning records of all the players'
task update_player_records: :environment do
  players = Player.all
  players.each do |player|
    won = 0
    lost = 0
    player.matches.each do |match|
      if match.players[0] == player
        if match.player_1_score > match.player_2_score
          won = won + 1
        elsif match.player_1_score < match.player_2_score
          lost = lost + 1
        end
      elsif match.players[1] == player
        puts 'p2'
        if match.player_2_score > match.player_1_score
          won = won + 1
        elsif match.player_2_score < match.player_1_score
          lost = lost + 1
        end
      end
    end
    player.update(won: won, lost: lost)
  end
end
