json.array!(@users) do |user|
  json.extract! user, :id, :name, :birthday, :age
  json.url user_url(user, format: :json)
end
