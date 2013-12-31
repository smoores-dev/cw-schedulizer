json.array!(@users) do |user|
  json.extract! user, :name, :netID
  json.url user_url(user, format: :json)
end