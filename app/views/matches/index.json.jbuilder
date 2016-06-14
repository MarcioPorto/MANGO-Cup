json.array!(@matches) do |match|
  json.extract! match, :id, :winner_id, :winner_score, :loser_id, :loser_score
  json.url match_url(match, format: :json)
end
