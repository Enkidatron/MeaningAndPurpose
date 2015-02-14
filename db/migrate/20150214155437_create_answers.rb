class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :textAnswer
      t.integer :intAnswer

      t.timestamps null: false
    end
  end
end
