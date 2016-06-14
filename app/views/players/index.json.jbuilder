json.array!(@players) do |player|
  json.extract! player, :id, :name, :won, :lost
  json.url player_url(player, format: :json)
end
