class AddShiftIdToPostedShift < ActiveRecord::Migration
  def change
    add_column :posted_shifts, :st_id, :string
  end
end
