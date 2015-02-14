class AddResponseToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :response, index: true
    add_foreign_key :answers, :responses
  end
end
