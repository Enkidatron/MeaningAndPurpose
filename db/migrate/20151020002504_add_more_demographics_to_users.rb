class AddMoreDemographicsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :education, :string
    add_column :users, :family_income, :string
  end
end
