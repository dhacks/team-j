class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :man_id
      t.integer :woman_id
      t.integer :group_id
      t.string :message
      t.datetime :ms_time

      t.timestamps null: false
    end
  end
end
