class AddUserToResponse < ActiveRecord::Migration
  def change
    add_reference :responses, :user, index: true
    add_foreign_key :responses, :users
  end
end
