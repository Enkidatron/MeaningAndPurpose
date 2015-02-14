class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.int :type
      t.int :family
      t.int :version

      t.timestamps null: false
    end
  end
end
