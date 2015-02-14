class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :version
      t.integer :family

      t.timestamps null: false
    end
  end
end
