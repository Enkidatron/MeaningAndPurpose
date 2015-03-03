class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :questiontype
      t.integer :family
      t.integer :version

      t.timestamps null: false
    end
  end
end
