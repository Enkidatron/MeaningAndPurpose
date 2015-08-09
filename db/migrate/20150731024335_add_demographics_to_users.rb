class AddDemographicsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :ethnicity, :string
    add_column :users, :religion, :string
  end
end
