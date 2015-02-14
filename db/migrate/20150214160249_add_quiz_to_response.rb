class AddQuizToResponse < ActiveRecord::Migration
  def change
    add_reference :responses, :quiz, index: true
    add_foreign_key :responses, :quizzes
  end
end
