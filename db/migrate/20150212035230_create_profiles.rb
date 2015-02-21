class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :qualifications
      t.string :location
      t.text :about
      t.references :user

      t.timestamps
    end
  end
end
