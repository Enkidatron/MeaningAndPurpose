json.array!(@questions) do |question|
  json.extract! question, :id, :question, :type, :family, :version
  json.url question_url(question, format: :json)
end
