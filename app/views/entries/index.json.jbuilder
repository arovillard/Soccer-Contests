json.array!(@entries) do |entry|
  json.extract! entry, :id, :team_a_name, :team_b_name, :team_a_score, :team_b_score
  json.url entry_url(entry, format: :json)
end
