class AddRepeatTypeTable < ActiveRecord::Migration
  def up
    create_table :repeats do |t|
      t.string :rtype
      t.integer :intervalSlot
      t.integer :dspan
      t.date :beginDay
      t.date :endDay
      t.string :rby
      t.integer :ev_id 
      t.string :classname
      t.string :rday
      t.integer :rtime
    end
  end

  def down
    drop_table :repeats
  end
end
