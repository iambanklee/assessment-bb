json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :candidate, :score, :invalid_score
  json.url campaign_url(campaign, format: :json)
end
