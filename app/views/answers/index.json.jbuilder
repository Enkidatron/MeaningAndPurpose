json.array!(@answers) do |answer|
  json.extract! answer, :id, :textAnswer, :intAnswer
  json.url answer_url(answer, format: :json)
end
