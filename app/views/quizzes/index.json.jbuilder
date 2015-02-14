json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :version, :family
  json.url quiz_url(quiz, format: :json)
end
