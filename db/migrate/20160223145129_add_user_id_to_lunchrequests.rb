class AddUserIdToLunchrequests < ActiveRecord::Migration
  def change
    add_column :lunchrequests, :user_id, :integer
  end
end
