json.array!(@votes) do |vote|
  json.extract! vote, :id, :vote_time, :campaign, :validity, :choice
  json.url vote_url(vote, format: :json)
end
