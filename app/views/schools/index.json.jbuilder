json.array!(@schools) do |school|
  json.extract! school, :id, :nome
  json.url school_url(school, format: :json)
end
