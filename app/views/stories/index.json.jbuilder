json.array!(@stories) do |story|
  json.extract! story, :id, :content, :user_id
  json.url story_url(story, format: :json)
end
