class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :position
      t.datetime :date
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :original_owner
      t.integer :current_owner
      t.string  :shift_id 
      t.string :shift_posted, :default => "Not Posted"

      t.timestamps
    end
  end
end
