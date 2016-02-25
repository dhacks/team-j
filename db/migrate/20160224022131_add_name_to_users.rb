class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :sex, :integer
    add_column :users, :department, :string
    add_column :users, :message, :text
  end
end
