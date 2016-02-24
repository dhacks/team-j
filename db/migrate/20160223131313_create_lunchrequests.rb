class CreateLunchrequests < ActiveRecord::Migration
  def change
    create_table :lunchrequests do |t|
      t.date        :date
      t.time        :time
      t.string      :place
      t.integer     :pepole
      t.timestamps
    end
  end
end
