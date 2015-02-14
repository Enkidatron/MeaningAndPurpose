class CreateQuestionships < ActiveRecord::Migration
  def change
    create_table :questionships do |t|
      t.references :quiz, index: true
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :questionships, :quizzes
    add_foreign_key :questionships, :questions
  end
end
