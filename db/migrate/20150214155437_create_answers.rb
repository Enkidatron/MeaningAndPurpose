class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :textAnswer
      t.int :intAnswer

      t.timestamps null: false
    end
  end
end
