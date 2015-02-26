class AddDefaultQuizToUser < ActiveRecord::Migration
  def change
    add_reference :users, :quiz, index: true
    add_foreign_key :users, :quizzes
  end
end
