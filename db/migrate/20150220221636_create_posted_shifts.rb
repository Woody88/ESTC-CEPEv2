class CreatePostedShifts < ActiveRecord::Migration
  def change
    create_table :posted_shifts do |t|
      t.string :position
      t.datetime :date
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :seller_id
      t.integer :buyer_id
      t.string :status, :default => "Not Traded"

      t.timestamps
    end
  end
end
