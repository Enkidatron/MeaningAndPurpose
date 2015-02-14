class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.int :version
      t.int :family

      t.timestamps null: false
    end
  end
end
