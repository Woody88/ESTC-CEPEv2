class AddIdToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :p_id, :string
  end
end
