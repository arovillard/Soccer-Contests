json.array!(@games) do |game|
  json.extract! game, :id, :contest_id, :team_a_name, :team_b_name, :team_a_result, :team_b_result, :game_date, :group
  json.url game_url(game, format: :json)
end
